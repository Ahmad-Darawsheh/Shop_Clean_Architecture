import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app_clean/core/cahche_helper/cahche_helper.dart';
import 'package:shop_app_clean/core/routes/route_names.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/core/services/services_locator.dart';
import 'package:shop_app_clean/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:shop_app_clean/features/profile/domain/usecase/edit_profile_usecase.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileUseCase editProfileUseCase;
  EditProfileBloc({required this.editProfileUseCase})
      : super(EditProfileInitial()) {
    on<EditUserProfileEvent>(_onEditUserProfileEvent);
    on<LogoutUserEvent>(_onLogoutUserEvent);
  }

  late final String email;
  late final String name;
  late final String phone;
  late final String image;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> initializeUserData() async {
    email = await CacheHelper.getData(key: "userEmail") ?? '';
    name = await CacheHelper.getData(key: "userName") ?? '';
    phone = await CacheHelper.getData(key: "userPhone") ?? '';
    image = await CacheHelper.getData(key: "userImage") ?? '';
  }

  Future<void> _onEditUserProfileEvent(
    EditUserProfileEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(EditUserProfileLoadingState());

    final response = await editProfileUseCase.editProfile(
      event.name,
      event.email,
      event.phone,
      event.image!,
    );

    response.fold((l) => emit(EditUserProfileFailureState(message: l.message)),
        (r) async {
      await CacheHelper.saveData(key: "userName", value: r.name);
      await CacheHelper.saveData(key: "userEmail", value: r.email);
      await CacheHelper.saveData(key: "userPhone", value: r.phone);
      await CacheHelper.saveData(key: "userImage", value: r.image);
      emit(EditUserProfileSuccessState(editProfileData: r));
    });
  }

  void _onLogoutUserEvent(
    LogoutUserEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    try {
      emit(LogoutUserLoadingState());
      await CacheHelper.removeData(key: "userId");
      await CacheHelper.removeData(key: "userName");
      await CacheHelper.removeData(key: "userEmail");
      await CacheHelper.removeData(key: "userPhone");
      await CacheHelper.removeData(key: "userImage");
      sl<NavigationService>().navigateToAndRemoveUntil(RouteNames.LOGIN);
      emit(LogoutUserSuccessState());
    } catch (e) {
      emit(LogoutUserErrorState());
    }
  }
}

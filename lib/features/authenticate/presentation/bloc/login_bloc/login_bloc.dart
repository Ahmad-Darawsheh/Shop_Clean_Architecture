import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/core/cache_helper/cache_helper.dart';
import 'package:shop_app_clean/features/authenticate/domain/entites/login_entity/login_entity.dart';
import 'package:shop_app_clean/features/authenticate/domain/usecases/login_usecase/login_usecase.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  LoginUseCase loginUseCase;
  LoginBloc(
    this.loginUseCase,
  ) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoginEventStart>(_onLoginEventStart);
  }

  void _onLoginEventStart(
      LoginEventStart event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginUseCase.login(event.email, event.password);
    result.fold((l) => emit(LoginError(l.message)), (r) {
      emit(LoginSuccess(r));
      
    });
  }
}

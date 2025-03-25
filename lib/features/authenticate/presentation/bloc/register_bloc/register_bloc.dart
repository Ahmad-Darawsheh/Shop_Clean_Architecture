import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/features/authenticate/domain/entites/register_entity/register_entity.dart';
import 'package:shop_app_clean/features/authenticate/domain/usecases/register_usecase/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});

    on<RegisterUserEvent>(_onRegisterUserEvent);
  }

  Future<void> _onRegisterUserEvent(
      RegisterUserEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final result = await registerUseCase.register(
        email: event.email,
        password: event.password,
        name: event.name,
        phone: event.phone);
    result.fold((l) => emit(RegisterFailure(l.message)), (r) {
      emit(RegisterSuccess(registerEntity: r));
      log(r.email);
    });
  }
}

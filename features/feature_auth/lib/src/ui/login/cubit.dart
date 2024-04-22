import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:validation_forms/forms/email.dart';
import 'package:validation_forms/forms/password.dart';

import '../../../feature_auth.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository auth;

  LoginCubit(this.auth) : super(const LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email.isValid ? email : Email.pure(value),
      isValid: Formz.validate([email, state.password]),
      errorGetter: () => null,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    final password = LoginPassword.dirty(value);
    emit(state.copyWith(
      password: password.isValid ? password : LoginPassword.pure(value),
      isValid: Formz.validate([state.email, password]),
      errorGetter: () => null,
      status: FormzSubmissionStatus.initial,
    ));
  }

  void emailUnfocused() {
    final email = Email.dirty(state.email.value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    ));
  }

  void passwordUnfocused() {
    final password = LoginPassword.dirty(state.password.value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([state.email, password]),
    ));
  }

  void loginButtonPressed() async {
    if (state.isValid && state.status != FormzSubmissionStatus.inProgress) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress, errorGetter: () => null));

      final result = await auth.loginWithEmailAndPassword(state.email.value, state.password.value);

      if (result.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure, errorGetter: () => result.left));
      }
    }
  }

  void consumeError() => emit(state.copyWith(
        errorGetter: () => null,
        status: FormzSubmissionStatus.initial,
      ));
}

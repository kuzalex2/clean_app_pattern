part of 'cubit.dart';

class LoginState extends Equatable {
  final Email email;
  final LoginPassword password;
  final FormzSubmissionStatus status;
  final AuthFailureMsg? error;
  final bool isValid;

  const LoginState({
    this.email = const Email.pure(),
    this.password = const LoginPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.error,
    this.isValid = false,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        error,
        isValid,
      ];

  LoginState copyWith({
    Email? email,
    LoginPassword? password,
    FormzSubmissionStatus? status,
    ValueGetter<AuthFailureMsg?>? errorGetter,
    bool? isValid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      error: errorGetter != null ? errorGetter.call() : error,
    );
  }
}

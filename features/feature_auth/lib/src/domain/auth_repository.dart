import 'package:feature_auth/src/domain/entity/user_entity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:either_dart/either.dart';

class AuthFailureMsg {
  final AuthFailure code;
  final String? message;
  const AuthFailureMsg(this.code, [this.message]);
}

enum AuthFailure {
  notImplemented,
  unknown,

  invalidEmail,
  userDisabled,
  emailAlreadyInUse,
  operationNotAllowed,
  weakPassword,
  userNotFound,
  wrongPassword,
  expiredActionCode,
  invalidActionCode,
  tooManyRequests,
  emailVerificationFailed,
  sendPasswordResetEmailFailed,
  confirmPasswordResetFailed;

  AuthFailureMsg get toFailure => AuthFailureMsg(this);
}

abstract class AuthRepository {
  ValueStream<UserEntity?> get user;

  Future<Either<AuthFailureMsg, bool>> initialize();

  Future<Either<AuthFailureMsg, bool>> sendEmailVerification();
  Future<Either<AuthFailureMsg, bool>> verifyEmail(String oobCode);

  Future<Either<AuthFailureMsg, bool>> loginWithEmailAndPassword(String email, String password);
  Future<Either<AuthFailureMsg, bool>> signUpWithEmailAndPassword(String email, String password);

  Future<Either<AuthFailureMsg, bool>> logInWithApple();

  Future<Either<AuthFailureMsg, bool>> sendPasswordResetEmail(String email);
  Future<Either<AuthFailureMsg, bool>> confirmPasswordReset(String oobCode, String newPassword);

  /// Signs out the current user which will emit
  /// [User.unauthorized] from the [user] Stream.
  ///
  Future<Either<AuthFailureMsg, bool>> logout();
}

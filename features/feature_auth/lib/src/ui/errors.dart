import '../../feature_auth.dart';

extension AuthFailureHumanString on AuthFailureMsg? {
  String? toHumanString(AuthStrings strings) {
    return switch (this?.code) {
      null || AuthFailure.notImplemented || AuthFailure.unknown => null,
      AuthFailure.invalidEmail ||
      AuthFailure.userDisabled ||
      AuthFailure.operationNotAllowed ||
      AuthFailure.weakPassword ||
      AuthFailure.userNotFound ||
      AuthFailure.wrongPassword ||
      AuthFailure.expiredActionCode ||
      AuthFailure.invalidActionCode ||
      AuthFailure.tooManyRequests ||
      AuthFailure.emailVerificationFailed ||
      AuthFailure.sendPasswordResetEmailFailed ||
      AuthFailure.confirmPasswordResetFailed =>
        this?.message,
      AuthFailure.emailAlreadyInUse => strings.emailAlreadyInUse,
    };
  }
}

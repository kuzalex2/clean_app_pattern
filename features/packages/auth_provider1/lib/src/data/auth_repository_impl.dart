import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:log/log.dart';
import 'package:rxdart/rxdart.dart';

///
///

class Provider1AuthImpl implements AuthRepository {
  final _controller = BehaviorSubject<UserEntity?>.seeded(null);

  @override
  ValueStream<UserEntity?> get user => _controller.stream;

  @override
  Future<Either<AuthFailureMsg, bool>> initialize() async {
    // await Future<void>.delayed(const Duration(seconds: 1));
    // _controller.add(UserEntity.unauthorized);
    _controller.add(fakeUser);

    /// for testing backend-caused logout
    ///
    // Future<void>.delayed(const Duration(seconds: 10))
    //     .then((value) => _controller.add(UserEntity.unauthorized));

    return const Right(true);

    // return Left(AuthFailure.notImplemented.toFailure);

    // Future<void>.delayed(const Duration(seconds: 3)).then((value) => _controller.add(fakeUser));
  }

  @override
  Future<Either<AuthFailureMsg, bool>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    _controller.add(fakeUser);
    return const Right(true);
  }

  void dispose() => _controller.close();

  @override
  Future<Either<AuthFailureMsg, bool>> logout() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    _controller.add(UserEntity.unauthorized);

    return const Right(true);
  }

  @override
  Future<Either<AuthFailureMsg, bool>> logInWithApple() {
    L.e("logInWithApple not implemented");
    return Future.delayed(
      const Duration(seconds: 1),
      () => Left(AuthFailure.notImplemented.toFailure),
    );
  }

  @override
  Future<Either<AuthFailureMsg, bool>> sendEmailVerification() {
    L.e("sendEmailVerification not implemented");
    return Future.delayed(
      const Duration(seconds: 1),
      () => Left(AuthFailure.notImplemented.toFailure),
    );
  }

  @override
  Future<Either<AuthFailureMsg, bool>> sendPasswordResetEmail(String email) {
    L.e("sendPasswordResetEmail not implemented");
    return Future.delayed(
      const Duration(seconds: 1),
      () => Left(AuthFailure.notImplemented.toFailure),
    );
  }

  @override
  Future<Either<AuthFailureMsg, bool>> confirmPasswordReset(String oobCode, String newPassword) {
    L.e("confirmPasswordReset not implemented");
    return Future.delayed(
      const Duration(seconds: 1),
      () => Left(AuthFailure.notImplemented.toFailure),
    );
  }

  @override
  Future<Either<AuthFailureMsg, bool>> signUpWithEmailAndPassword(
      String email, String password) async {
    _controller.add(fakeUserNotConfirmed);
    return const Right(true);
  }

  @override
  Future<Either<AuthFailureMsg, bool>> verifyEmail(String oobCode) {
    L.e("verifyEmail not implemented");
    return Future.delayed(
      const Duration(seconds: 1),
      () => Left(AuthFailure.notImplemented.toFailure),
    );
  }
}

final fakeUser = UserEntity(
  id: '123',
  email: 'email@email.com',
  publicUser: PublicUserEntity(
    photoUrl: '',
    displayName: '',
    username: '',
    createTime: DateTime.now(),
    id: '123',
  ),
  privateUser: const PrivateUserEntity(
    emailVerified: true,
    onboardingInterestsFilled: true,
    onboardingProfileFilled: true,
    id: '123',
  ),
);

final fakeUserNotConfirmed = UserEntity(
  id: '123',
  email: 'email@email.com',
  publicUser: PublicUserEntity(
    photoUrl: '',
    displayName: '',
    username: '',
    createTime: DateTime.now(),
    id: '123',
  ),
  privateUser: const PrivateUserEntity(
    emailVerified: false,
    onboardingInterestsFilled: true,
    onboardingProfileFilled: true,
    id: '123',
  ),
);

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final PublicUserEntity publicUser;
  final PrivateUserEntity privateUser;

  const UserEntity({
    required this.id,
    required this.email,
    required this.publicUser,
    required this.privateUser,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    PublicUserEntity? publicUser,
    PrivateUserEntity? privateUser,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      publicUser: publicUser ?? this.publicUser,
      privateUser: privateUser ?? this.privateUser,
    );
  }

  static const unauthorized = UserEntity(
    id: '',
    email: '',
    publicUser: PublicUserEntity.empty,
    privateUser: PrivateUserEntity.empty,
  );

  bool get isUnauthorized => this == unauthorized;
  bool get isAuthorized => !isUnauthorized;
  bool get isLoaded => isAuthorized && publicUser.isNotEmpty && privateUser.isNotEmpty;

  bool get loggedIn => isAuthorized && privateUser.isNotEmpty && publicUser.isNotEmpty;
  bool get notLoggedIn => !loggedIn;

  @override
  List<Object?> get props => [
        id,
        email,
        publicUser,
        privateUser,
      ];
}

///
/// Public part of User data
///

class PublicUserEntity extends Equatable {
  final String id;
  final String photoUrl;
  final String displayName;
  final String username;
  final DateTime? createTime;

  const PublicUserEntity({
    required this.id,
    required this.photoUrl,
    required this.displayName,
    required this.createTime,
    required this.username,
  });

  static const empty = PublicUserEntity(
    id: '',
    photoUrl: '',
    displayName: '',
    username: '',
    createTime: null,
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  PublicUserEntity copyWith({
    String? id,
    String? photoUrl,
    String? displayName,
    String? username,
    ValueGetter<DateTime?>? createTimeGetter,
  }) {
    return PublicUserEntity(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      createTime: createTimeGetter != null ? createTimeGetter.call() : createTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        photoUrl,
        displayName,
        createTime,
        username,
      ];
}

///
/// Private part of User data
///

class PrivateUserEntity extends Equatable {
  final String id;
  final bool emailVerified;
  final bool onboardingProfileFilled;
  final bool onboardingInterestsFilled;

  const PrivateUserEntity({
    required this.id,
    required this.emailVerified,
    required this.onboardingProfileFilled,
    required this.onboardingInterestsFilled,
  });

  static const empty = PrivateUserEntity(
    id: '',
    emailVerified: false,
    onboardingProfileFilled: false,
    onboardingInterestsFilled: false,
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => !isEmpty;

  PrivateUserEntity copyWith({
    String? id,
    bool? emailVerified,
    bool? wizardCompleted,
    bool? onboardingInterestsFilled,
    bool? onboardingProfileFilled,
  }) {
    return PrivateUserEntity(
      id: id ?? this.id,
      emailVerified: emailVerified ?? this.emailVerified,
      onboardingProfileFilled: onboardingProfileFilled ?? this.onboardingProfileFilled,
      onboardingInterestsFilled: onboardingInterestsFilled ?? this.onboardingInterestsFilled,
    );
  }

  @override
  List<Object?> get props => [
        id,
        emailVerified,
        onboardingProfileFilled,
        onboardingInterestsFilled,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:utils/utils.dart';

class AppConfig extends Equatable {
  final Flavor flavor;

  final bool enableDebugView;
  final bool enableQaLogging;
  final bool analyticsEnabled;
  final String userAgreementUrl;

  const AppConfig(
    this.flavor, {
    required this.enableDebugView,
    required this.enableQaLogging,
    required this.analyticsEnabled,
    required this.userAgreementUrl,
  });

  AppConfig copyWith({
    bool? enableDebugView,
    bool? enableQaLogging,
    bool? analyticsEnabled,
    String? userAgreementUrl,
    Flavor? flavor,
  }) {
    return AppConfig(
      flavor ?? this.flavor,
      enableDebugView: enableDebugView ?? this.enableDebugView,
      enableQaLogging: enableQaLogging ?? this.enableQaLogging,
      analyticsEnabled: analyticsEnabled ?? this.analyticsEnabled,
      userAgreementUrl: userAgreementUrl ?? this.userAgreementUrl,
    );
  }

  @override
  List<Object?> get props => [
        flavor,
        enableDebugView,
        enableQaLogging,
        analyticsEnabled,
        userAgreementUrl,
      ];
  List<String> get propNames => [
        'flavor',
        'enableDebugView',
        'enableQaLogging',
        'analyticsEnabled',
        'userAgreementUrl',
      ];
}

extension AppConfigDump on AppConfig {
  String dump() =>
      '$runtimeType(${propNames.map((propName) => '$propName: ${props[propNames.indexOf(propName)]}').join(', ')})';
}

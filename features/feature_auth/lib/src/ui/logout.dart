import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature_auth.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    return TextButton(
        onPressed: () => RepositoryProvider.of<AuthRepository>(context).logout(),
        child: Text(strings.logout));
  }
}

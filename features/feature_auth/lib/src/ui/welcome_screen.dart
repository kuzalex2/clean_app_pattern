import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';

import '../../feature_auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<_OnBoardCubit>(
      create: (context) => _OnBoardCubit(
        RepositoryProvider.of<AuthRepository>(context),
      )..initialize(),
      child: const _WelcomeScreen(),
    );
  }
}

class _WelcomeScreen extends StatelessWidget {
  const _WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      body: BlocBuilder<_OnBoardCubit, _OnBoardState>(
          builder: (BuildContext context, _OnBoardState state) {
        switch (state) {
          case _OnBoardState.initial:
          case _OnBoardState.initializing:
          case _OnBoardState.ok:
            return const Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ...
                      ],
                    ),
                  ),
                ),
              ],
            );
          case _OnBoardState.error:
            return const _ErrorWidget();
        }
      }),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Alertings(
                  text: Text(strings.startupError),
                  icon: Assets.graphics.icons.menu.m.lostConnection.svg(),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Button.primary(
                onPressed: context.read<_OnBoardCubit>().initialize,
                title: Text(strings.refresh),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum _OnBoardState {
  initial,
  initializing,
  ok,
  error,
}

class _OnBoardCubit extends Cubit<_OnBoardState> {
  final AuthRepository authRepository;
  _OnBoardCubit(this.authRepository) : super(_OnBoardState.initial);

  void initialize() async {
    if (state == _OnBoardState.error || state == _OnBoardState.initial) {
      emit(_OnBoardState.initializing);
      final result = await authRepository.initialize();
      result.fold(
        (l) => emit(_OnBoardState.error),
        (r) => emit(_OnBoardState.ok),
      );
    }
  }
}

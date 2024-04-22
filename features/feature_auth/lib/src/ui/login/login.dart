import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:router/router.dart';
import 'package:validation_forms/forms/email.dart';
import 'package:validation_forms/forms/password.dart';
import 'package:uikit/uikit.dart';
import 'package:feature_auth/src/ui/errors.dart';

import '../../../feature_auth.dart';

import 'cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KitColors.surfacePrimary,
      appBar: const KitAppBar(),
      body: BlocProvider(
        create: (_) => LoginCubit(RepositoryProvider.of<AuthRepository>(context)),
        child: const _LoginBody(),
      ),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginBody> {
  static const _pagePadding = EdgeInsets.only(top: 43.0, left: 32.0, right: 32.0, bottom: 32.0);

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  late final VoidCallback _emailFocusNodeListener;
  late final VoidCallback _passwordFocusNodeListener;

  _addFocusListeners() {
    _emailFocusNode.addListener(_emailFocusNodeListener);
    _passwordFocusNode.addListener(_passwordFocusNodeListener);
  }

  _removeFocusListeners() {
    _emailFocusNode.removeListener(_emailFocusNodeListener);
    _passwordFocusNode.removeListener(_passwordFocusNodeListener);
  }

  @override
  void initState() {
    super.initState();

    _emailFocusNodeListener = () {
      if (!_emailFocusNode.hasFocus) {
        context.read<LoginCubit>().emailUnfocused();
      }
    };

    _passwordFocusNodeListener = () {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginCubit>().passwordUnfocused();
      }
    };

    _addFocusListeners();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _removeFocusListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure && state.humanError(strings) == null) {
          context.read<LoginCubit>().consumeError();

          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(KitSnackBars.simple(strings.loginErrorText));
        }
      },
      child: SingleChildScrollView(
        padding: _pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              strings.loginPageTitle,
              style: TextStyles.mobileH1.copyWith(color: KitColors.textPrimary),
            ),
            const SizedBox(height: 32),
            _EmailInput(
              focusNode: _emailFocusNode,
            ),
            const SizedBox(height: 10),
            _PasswordInput(
              focusNode: _passwordFocusNode,
            ),
            const Row(
              children: [
                _ForgotPasswordButton(),
              ],
            ),
            const SizedBox(height: 32),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

extension on LoginState {
  String? humanError(AuthStrings strings) {
    if (status.isFailure) {
      return switch (error?.code) {
        AuthFailure.userNotFound || AuthFailure.wrongPassword => strings.wrongEmailOrPassword,
        _ => error.toHumanString(strings),
      };
    } else {
      return null;
    }
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Button.dangerUnderline(
        title: Text(strings.forgotPasswordButtonTitle),
        onPressed: () {
          context.go(RouterPath.sendResetPassword, extra: state.email.value);
        },
      );
    });
  }
}

class _EmailInput extends StatelessWidget {
  final FocusNode focusNode;

  const _EmailInput({required this.focusNode});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return KitTextFormField2.primary(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: context.read<LoginCubit>().emailChanged,
          keyboardType: TextInputType.emailAddress,
          readOnly: state.status.isInProgress || state.status.isSuccess,
          focusNode: focusNode,
          autofocus: true,
          inputFormatters: Email.inputFormatters,
          textInputAction: TextInputAction.next,
          hintText: strings.inputEmailPlaceholder,
          errorText: state.humanError(strings) ??
              (state.email.isPure || state.email.isValid || state.email.value.isEmpty
                  ? null
                  : strings.inputEmailInvalidText),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final FocusNode focusNode;

  const _PasswordInput({required this.focusNode});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password || previous.status != current.status,
      builder: (context, state) {
        return KitTextFormField2.password(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
          textInputAction: TextInputAction.send,
          onFieldSubmitted: (_) {
            context.read<LoginCubit>().loginButtonPressed();
          },
          inputFormatters: LoginPassword.inputFormatters,
          focusNode: focusNode,
          readOnly: state.status.isInProgress || state.status.isSuccess,
          hintText: strings.inputPasswordPlaceholder,
          errorText: state.password.isPure || state.password.isValid || state.password.value.isEmpty
              ? null
              : strings.enterAPassword,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final canBePressed = state.status != FormzSubmissionStatus.inProgress && state.isValid;
        return SizedBox(
          width: double.infinity,
          child: Button.primary(
            key: const Key('loginForm_continue_raisedButton'),
            title: Text(strings.loginButtonTitle),
            padding: EdgeInsets.zero,
            isLoading: state.status.isInProgress || state.status.isSuccess,
            onPressed: canBePressed ? context.read<LoginCubit>().loginButtonPressed : null,
          ),
        );
      },
    );
  }
}

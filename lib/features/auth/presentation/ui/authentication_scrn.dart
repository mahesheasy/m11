import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:m11_ind/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/widgets/widgets.dart';

class AuthenticationScrn extends StatefulWidget {
  const AuthenticationScrn({super.key});

  @override
  State<AuthenticationScrn> createState() => _AuthenticationScrnState();
}

class _AuthenticationScrnState extends State<AuthenticationScrn> {
  late final TextEditingController username;
  late final TextEditingController pswd;
  bool showPswd = true;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    pswd = TextEditingController();
  }

  void togglePswd() => setState(() {
    showPswd = !showPswd;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
            margin: const EdgeInsets.all(12.0),
            defaultHeight: 12.0,
            children: [
              SizedBox(
                width: context.sizeOfWidth,
                child: AppIcons.m11BgLogo.toWidget(height: 120),
              ),
              Text('Sign In',
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Hi Welcome back, you've been missed",
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppSpacer.p12(),
              AppTextField(
                title: 'User ID',
                isRequired: true,
                controller: username,
              ),
              AppTextField(
                title: 'Password',
                isRequired: true,
                controller: pswd,
                obscureText: showPswd,
                suffix: InkWell(
                  onTap: togglePswd,
                  child: Text(
                    showPswd ? ' show ' : ' hide ',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.transparent,
                      shadows: [
                        const Shadow(color: AppColors.green, offset: Offset(0, -5)),
                      ],
                      decorationColor: AppColors.green,
                      decoration: TextDecoration.underline,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () => AppRoute.forgotpswd.push(context),
                  child: Text(
                    'Forgot Password?',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.haintBlue, 
                      decoration: TextDecoration.underline, 
                      decorationColor: AppColors.haintBlue,
                    ),
                  ),
                ),
              ),
              BlocConsumer<SignInCubit, SignInState>(
                listener: (_, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: context.cubit<AuthCubit>().authCheckRequested,
                    failure: (failure) => AppDialog.showErrorDialog(context, content: failure.error, onTapDismiss: context.exit),
                  );
                },
                builder: (_, state) {
                  return AppButton(
                    label: 'Sign In',
                    bgColor: AppColors.haintBlue,
                    isLoading: state.isLoading,
                    margin: const EdgeInsets.all(12),
                    onPressed: () => context
                        .cubit<SignInCubit>()
                        .login(username.text, pswd.text),
                  );
                },
              ),
              const _TermsAndConditions(),
              AppSpacer.p12(),
              _registerWidget(),
            ],
          ),
        ),
      ),
    );
  }
      
  Widget _registerWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        children: [
          const TextSpan(text: 'Dont have an account? '),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = _goToRegistration,
            text: ' Sign Up',
            style: const TextStyle(color: AppColors.haintBlue),
          ),
        ],
      ),
    ),
  );
 
  void _goToRegistration() => AppRoute.register.push(context);
}


class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('By continuing you agree to'),
        RichText(
          text: TextSpan(
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.haintBlue, 
              fontSize: 12, 
              fontWeight: FontWeight.w600, 
            ),
            children: const [
              TextSpan(text: 'Our Terms'),
              TextSpan(text: '  &  ', style: TextStyle(color: AppColors.black)),
              TextSpan(text: 'Privacy'),
            ],
          ),
        ),
      ],
    );
  }
}
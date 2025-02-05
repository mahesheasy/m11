import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/model/otp_request_type.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/commons/widgets/otp_verf_dialog.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:m11_ind/features/auth/presentation/bloc/registration/registration_cubit.dart';

class UserRegistrationScrn extends StatefulWidget {
  const UserRegistrationScrn({super.key});

  @override
  State<UserRegistrationScrn> createState() => _UserRegistrationScrnState();
}

class _UserRegistrationScrnState extends State<UserRegistrationScrn> {
  late final TextEditingController fullname;
  late final TextEditingController email;
  late final TextEditingController mobileNumber;
  late final TextEditingController password;
  late final TextEditingController confPassword;

  bool showPswd = true;
  bool showCNFPswd = true;

  @override
  void initState() {
    super.initState();
    fullname = TextEditingController();
    email = TextEditingController();
    mobileNumber = TextEditingController();
    password = TextEditingController();
    confPassword = TextEditingController();
  }

  void togglePswd() => setState(() {
        showPswd = !showPswd;
      });

  void toggleCNFPswd() => setState(() {
        showCNFPswd = !showCNFPswd;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account'), centerTitle: true),
      body: BlocListener<RegistrationCubit, RegistrationState>(
        listener: (_, state) async {
          if (state.failure.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              content: state.failure!.error,
              onTapDismiss: context.close,
            );
            if (!context.mounted) return;
            context.cubit<RegistrationCubit>().errorHandled();
          }
          if (state.isSuccess) {
            await AppDialog.showSuccessDialog(
              context,
              content: 'Registration successful',
              onTapDismiss: context.close,
            );
            if (!context.mounted) return;
            context.close();
          }
        },
        child: SingleChildScrollView(
          child: SpacedColumn(
            defaultHeight: 10.0,
            margin: const EdgeInsets.all(12.0),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to M11 Partners, Please register\n'
                'yourself access the app',
                style: TextStyles.titleSmall(context),
                textAlign: TextAlign.center,
              ),
              AppTextField(
                title: 'FBO Name',
                controller: fullname,
                isRequired: true,
                suffixIcon: const Icon(Icons.person_outline, color: AppColors.green),
                onChanged: (text) {
                  context.cubit<RegistrationCubit>().onFieldChange(
                        fullName: text,
                      );
                },
              ),
              AppTextField(
                title: 'Email',
                controller: email,
                suffixIcon: const Icon(Icons.mark_email_read_outlined,
                    color: AppColors.green),
                inputType: TextInputType.emailAddress,
                isRequired: true,
                onChanged: (text) {
                  context.cubit<RegistrationCubit>().onFieldChange(
                        email: text,
                      );
                },
              ),
              AppTextField(
                title: 'Mobile Number',
                controller: mobileNumber,
                inputType: TextInputType.number,
                isRequired: true,
                maxLength: 10,
                suffixIcon: const Icon(Icons.dialpad_outlined, color: AppColors.green),
                onChanged: (text) {
                  context.cubit<RegistrationCubit>().onFieldChange(
                        mobileNumber: text,
                      );
                },
              ),
              AppTextField(
                title: 'Password',
                controller: password,
                isRequired: true,
                obscureText: showPswd,
                suffixIcon: IconButton(
                  onPressed: togglePswd,
                  icon: showPswd
                      ? const Icon(Icons.visibility, color: AppColors.green)
                      : const Icon(Icons.visibility_off, color: AppColors.red),
                ),
                onChanged: (text) {
                  context.cubit<RegistrationCubit>().onFieldChange(
                        password: text,
                      );
                },
              ),
              AppTextField(
                title: 'Re-enter Password',
                controller: confPassword,
                isRequired: true,
                onChanged: (text) {
                  context.cubit<RegistrationCubit>().onFieldChange(
                        cnfPassword: text,
                      );
                },
                obscureText: showCNFPswd,
                suffixIcon: IconButton(
                  onPressed: toggleCNFPswd,
                  icon: showCNFPswd
                      ? const Icon(Icons.visibility, color: AppColors.green)
                      : const Icon(Icons.visibility_off, color: AppColors.red),
                ),
              ),
              AppSpacer.p8(),
              BlocBuilder<RegistrationCubit, RegistrationState>(
                builder: (_, state) {
                  return AppButton(
                    label: 'Sign Up',
                    bgColor: AppColors.haintBlue,
                    isLoading: state.isLoading,
                    onPressed: () {
                      final cubit = context.cubit<RegistrationCubit>();
                      cubit.validate().fold(
                        () async {
                          final isVerified = await OTPVerfDialog.launchOTPVerfDialog(
                            context, 
                            mobileNumber: mobileNumber.text, 
                            type: OTPRequestType.registration,
                          );
                          if(isVerified && context.mounted) {
                            cubit.signUp();
                          }
                        }, 
                        cubit.emitError,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

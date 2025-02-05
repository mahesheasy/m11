import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m11_ind/app/presentation/ui/weighing_scale_scrn.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';
import 'package:m11_ind/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned.fill(
            top: 24,
            left: context.sizeOfWidth * 0.3,
            child: Container(
              color: AppColors.white,
              child: SingleChildScrollView(
                child: SpacedColumn(
                  mainAxisSize: MainAxisSize.max,
                  borderException: const [0, 1, 2],
                  divider: const Divider(indent: 16, endIndent: 16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Settings',
                          style: TextStyles.titleBold(context, size: 24)),
                    ),
                    SvgPicture.asset(AppIcons.icSettings.path),
                    AppSpacer.p24(),
                    _SettingsListTile(
                      onTap: () => AppRoute.accountDetails.push(context),
                      leading: const Icon(Icons.person_2_outlined,
                          color: AppColors.green),
                      title: 'Account',
                    ),
                    if (!context.user.isFBO) ...[
                      _SettingsListTile(
                        onTap: () => AppRoute.bdeNotifications.push(context),
                        leading: const Icon(Icons.notifications_outlined,
                            color: AppColors.green),
                        title: 'Notifications',
                      ),
                      _SettingsListTile(
                        leading: const Icon(Icons.bluetooth_outlined, color: AppColors.green),
                        title: 'Weighing Scale',
                        onTap: () {
                          context.goToPage(const WeighingScaleScrn());
                        },
                      ),
                    ],
                    _SettingsListTile(
                      onTap: () => launchUrlString(Urls.m11Site),
                      leading: const Icon(Icons.info_outline, color: AppColors.green),
                      title: 'About M11',
                    ),
                    _SettingsListTile(
                      leading: const Icon(Icons.logout, color: AppColors.green),
                      title: 'Logout',
                      onTap: context.cubit<AuthCubit>().signOut,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 24,
            left: context.sizeOfWidth * 0.3 - 24,
            child: Container(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: AppColors.white, width: 0),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
              child: IconButton.outlined(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: AppColors.green,
                  size: 32,
                ),
                onPressed: context.close,
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0x12000000),
                  side: const BorderSide(color: AppColors.white, width: 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.leading,
    required this.title,
    this.onTap,
  });

  final Widget leading;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      leading: leading,
      title: Text(title, style: TextStyles.titleBold(context)),
      onTap: onTap,
    );
  }
}

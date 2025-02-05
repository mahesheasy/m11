import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Account Details',
      bgImagePath: AppIcons.pickUpBg.path,
      showDrawer: false,
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Welcome', value: context.user.username),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DetailTile(title: 'Depo', value: context.user.depoName),
            DetailTile(title: 'User Name', value: context.user.username.toUpperCase()),
            DetailTile(title: 'Role', value: context.user.userType?.toUpperCase()),
            DetailTile(title: 'Email', value: context.user.email),
            DetailTile(title: 'Mobile Number', value: context.user.mobileNo ?? context.user.phone),
          ],
        ),
      ),
    );
  }
}


class DetailTile extends StatelessWidget {
  const DetailTile({super.key, required this.title, this.value});

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0),
      titleTextStyle: TextStyles.labelMedium(context),
      subtitleTextStyle: TextStyles.labelLarge(context),
      title: Text(title),
      subtitle: Text(value.valueOrEmpty),
    );
  }
}
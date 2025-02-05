import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/ui/app_end_drawer.dart';
import 'package:m11_ind/app/presentation/widgets/drawer_icon_btn.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/go_back_icon_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppScaffoldWidget extends StatelessWidget {
  const AppScaffoldWidget({
    super.key,
    this.title,
    this.bgImagePath,
    required this.headerWidget,
    required this.child,
    this.appbar,
    this.canPop = true,
    this.showDrawer = true,
    this.margin = const EdgeInsets.all(16),
  });

  final String? title;
  final String? bgImagePath;
  final Widget headerWidget;
  final Widget? appbar;
  final bool canPop;
  final bool showDrawer;
  final Widget child;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      drawer: const SizedBox(),
      drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      endDrawer: showDrawer ? const AppEndDrawer() : null,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (bgImagePath.containsValidValue) ...[
              if (bgImagePath.isSVG) ...[
                SvgPicture.asset(bgImagePath!,
                    width: context.sizeOfWidth, alignment: Alignment.topLeft),
              ] else ...[
                Image.asset(bgImagePath!,
                    width: context.sizeOfWidth,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft),
              ],
            ] else ...[
              Container(
                color: const Color(0xff5DA881),
                child: SvgPicture.asset(
                  AppIcons.greenLayer.path,
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft,
                ),
              ),
            ],
            Positioned(
              top: 12,
              left: 12,
              right: 0,
              child: Row(
                children: [
                  if (canPop) ...[
                    const GoBackIconBtn(),
                    const SizedBox(width: 10.0),
                  ],
                  if (appbar != null) ...[appbar!] else
                    Text(title!, style: TextStyles.appbarTextstyle(context)),
                  if (showDrawer) ...[const Spacer(), const DrawerIconBtn()],
                ],
              ),
            ),
            headerWidget,
            Positioned.fill(
              top: kToolbarHeight + 110,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.white),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: margin,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

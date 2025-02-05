import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if(kReleaseMode && !Urls.isTest) {
      return child;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        color: AppColors.haintBlue,
        message: _message,
        location: BannerLocation.topEnd,
        textStyle: TextStyle(
          color: _color,
          fontSize: 12.0 * 0.85,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
        child: child,
      ),
    );
  }

  String get _message => (kDebugMode) ? 'M11 DEBUG' : 'M11 UAT';

  Color get _color => HSLColor.fromColor(AppColors.red).lightness < 0.8
      ? Colors.white
      : Colors.black87;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOGreetingCard extends StatelessWidget {
  const FBOGreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: M11Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text('Welcome,\nto the Team M11', 
                        style: TextStyles.titleBold(context).copyWith(color: AppColors.white),
                      ),
                    ),
                    AppSpacer.p8(),
                    Text(context.user.name, style: TextStyles.titleBold(context).copyWith(
                      color: AppColors.white,
                      fontSize: 18,
                    )),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: AppIcons.icFBOWelcome.toWidget(
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

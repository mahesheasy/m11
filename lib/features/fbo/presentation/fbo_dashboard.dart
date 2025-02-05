import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/ui/app_end_drawer.dart';
import 'package:m11_ind/app/presentation/widgets/accessible_features.dart';
import 'package:m11_ind/app/presentation/widgets/drawer_icon_btn.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/fbo/presentation/bloc/fbo_bloc_provider.dart';
import 'package:m11_ind/features/fbo/presentation/widgets/fbo_greeting_card.dart';
import 'package:m11_ind/widgets/app_spacer.dart';
import 'package:m11_ind/widgets/loading_indicator.dart';

class FBODashBoardScrn extends StatelessWidget {
  const FBODashBoardScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppEndDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [DrawerIconBtn()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const FBOGreetingCard(),
            AppSpacer.p32(),
            BlocConsumer<FBOStatusCubit, FBOStatusCubitState>(
              listener: (_, state) {
                if(state.isSuccess) {
                  state.handle(
                    context, 
                    success: (data) async {
                      if(data.first.containsValidValue) {
                        await register<String>(data.first, instanceName: 'fbo_id');
                      }
                    },
                  );
                }
              },
              builder: (_, state) {
                if(state.isLoading) {
                  const Center(child: LoadingIndicator());
                }
                final isEnrolled = state.maybeWhen(
                  success: (data) => data.second,
                  orElse: () => false,
                );
                return AccessibleFeatures(isAccessible: isEnrolled);
              },
            ),
          ],
        ),
      ),
    );
  }
}

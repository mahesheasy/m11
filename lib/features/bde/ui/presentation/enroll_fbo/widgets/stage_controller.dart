import 'package:flutter/material.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';

class StageController extends StatelessWidget {
  const StageController({super.key});

  @override
  Widget build(BuildContext context) {
    return EnrollFBOBlocBuilder(
      builder: (_, state) => const Row(
        children: [

        ],
      ),
    );
  }
}
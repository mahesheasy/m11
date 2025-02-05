import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/ce/models/update_fssai_form.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBODetailsCard extends StatefulWidget {
  final FBODetails fbo;

  const FBODetailsCard({Key? key, required this.fbo}) : super(key: key);

  @override
  State<FBODetailsCard> createState() => _FBODetailsCardState();
}

class _FBODetailsCardState extends State<FBODetailsCard> {
  @override
  Widget build(BuildContext context) {
    print('ajdnmnanf ${widget.fbo.fssaiNumber}');
    final UpdateFssaiForm form = UpdateFssaiForm(
      supplierName: widget.fbo.name,
      updateFssaiNumber: widget.fbo.updateFssaiNo,
      certificateImage: '',
    );

    final contactNo = widget.fbo.mobileNo.containsValidValue
        ? widget.fbo.mobileNo
        : widget.fbo.managerContactNo.valueOrEmpty;

    return Card(
      margin: EdgeInsets.zero,
      surfaceTintColor: AppColors.white,
      color: AppColors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: AppColors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SpacedColumn(
        margin: const EdgeInsets.all(8.0),
        children: [
          CardFieldWidget('Hotel Name', widget.fbo.businessName),
          CardFieldWidget('FBO Name', widget.fbo.supplierName),
          CardFieldWidget('Address', widget.fbo.primaryAddress),
          CardFieldWidget('Email', widget.fbo.email),
          CardFieldWidget('Contact No.', contactNo),
          CardFieldWidget('GST No.', widget.fbo.gstNumber),
          CardFieldWidget(
              'Can Details.', '${widget.fbo.cansGiven} (30Kg each)'),
          CardFieldWidget(
              'FSSAI NO.',
              widget.fbo.fssaiNumber.doesNotHaveValue
                  ? form.updateFssaiNumber
                  : widget.fbo.fssaiNumber),
          if (widget.fbo.fssaiNumber.doesNotHaveValue)
            _buildUpdateFSSAIButton(context),
        ],
      ),
    );
  }

  Widget _buildUpdateFSSAIButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showUpdateFSSAIDialog(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Update FSSAI',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showUpdateFSSAIDialog(BuildContext context) {
    final cubit = context.read<EnrollFboCubit>();
    showDialog(
      context: context,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.cubit<UpdateFssaiCubit>(),
          ),
          BlocProvider.value(
            value: context.cubit<FBODetailsCubit>(),
          ),
        ],
        child: UpdateFSSAIDialog(
          fbo: widget.fbo,
          enrollFboCubit: cubit,
        ),
      ),
    );
  }
}

class UpdateFSSAIDialog extends StatefulWidget {
  final FBODetails fbo;
  final EnrollFboCubit enrollFboCubit;

  const UpdateFSSAIDialog(
      {Key? key, required this.fbo, required this.enrollFboCubit})
      : super(key: key);

  @override
  _UpdateFSSAIDialogState createState() => _UpdateFSSAIDialogState();
}

class _UpdateFSSAIDialogState extends State<UpdateFSSAIDialog> {
  final TextEditingController _fssaiController = TextEditingController();
  String? _capturedImage;
  String? _imageError;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fssaiController.text = widget.fbo.fssaiNumber ?? '';
  }

  @override
  void dispose() {
    _fssaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Update FSSAI Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildLabelWithAsterisk('FSSAI Number'),
                const SizedBox(height: 4),
                _buildFSSAITextField(),
                const SizedBox(height: 16),
                _buildLabelWithAsterisk('FSSAI Certificate Image'),
                const SizedBox(height: 4),
                UploadPhotoWidget(
                  defaultValue: widget.fbo.certificateImage,
                  imageUrl: widget.fbo.certificateImageUrl,
                  onFileCapture: (file) {
                    final data = uploadImage(file);
                    setState(() {
                      _capturedImage = data;
                      _imageError = null;
                    });
                  },
                ),
                if (_imageError != null)
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Please upload an FSSAI certificate image.',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 24),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String uploadImage(File? file) {
    if (file != null) {
      final fileByteData = file.readAsBytesSync();
      return base64Encode(fileByteData);
    }
    return '';
  }

  Widget _buildLabelWithAsterisk(String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 4),
        const Text(
          "*",
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildFSSAITextField() {
    return TextFormField(
      controller: _fssaiController,
      keyboardType: TextInputType.number,
      maxLength: 14,
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 14) {
          return 'Please enter a valid 14-digit FSSAI number.';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter 14-digit FSSAI number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        counterText: "",
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Cancel'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: BlocConsumer<UpdateFssaiCubit, UpdateFssaiCubitState>(
            listener: (context, state) {
              state.maybeWhen(
                  failure: (failure) => AppDialog.showErrorDialog(
                  context,
                  content: failure.error,
                  onTapDismiss: () => Navigator.of(context).pop(),
                ),
                success: (data) {
                  AppDialog.showSuccessDialog(
                    context,
                    content:
                        'FSSAI Number & Certificate Image Updated Successfully',
                    onTapDismiss: () => context..close()..close(),
                  );
                     Future.delayed(
                    const Duration(milliseconds: 300),
                    () async {
                      await context
                          .cubit<FBODetailsCubit>()
                          .request(widget.fbo.name);
                    },
                  );
                },
                
                orElse: () {},
              );
            },
            builder: (context, state) {
              final loading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
                failure: (failure) => false,
                success: (data) => false,
              );
              return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_capturedImage == null) {
                      setState(() {
                        _imageError =
                            'Please upload an FSSAI certificate image.';
                      });
                      return; // Stop execution if the image is missing
                    }

                    final form = EnrollFBO(
                      id: widget.fbo.name,
                      fssaiNumber: _fssaiController.text.trim(),
                      certificateImage: _capturedImage,
                    );

                    context.read<UpdateFssaiCubit>().request(form);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/core/utils/attachment_selection_mixin.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UploadPhotoWidget extends StatefulWidget {
  const UploadPhotoWidget({
    super.key, 
    this.title, 
    this.defaultValue, 
    this.imageUrl, 
    this.readOnly = false, 
    required this.onFileCapture,
  });

  final String? title;
  final String? imageUrl;
  final String? defaultValue;
  final bool readOnly;
  final Function(File? file) onFileCapture;

  @override
  State<UploadPhotoWidget> createState() => _UploadPhotoWidgetState();
}

class _UploadPhotoWidgetState extends State<UploadPhotoWidget>
    with AttahcmentSelectionMixin {
  Image? selectedFile;

  @override
  void initState() {
    super.initState();
    if(widget.defaultValue.isNotNull) {
      final fileBytes = base64Decode(widget.defaultValue!);
      final imgMem = Image.memory(fileBytes, fit: BoxFit.fitHeight);
      selectedFile = imgMem;
    }
    if(widget.imageUrl.isNotNull) {
      final imgMem = Image.network(
        Urls.filepath(widget.imageUrl!), 
        fit: BoxFit.fitWidth,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: LoadingIndicator());
        },
      );
      selectedFile = imgMem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly,
      child: SpacedColumn(
        defaultHeight: 0,
        margin: EdgeInsets.zero,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title.containsValidValue)...[
            CaptionText(title: widget.title!, isRequired: false),
            AppSpacer.p4(),
          ],
          Container(
            height: 200,
            width: context.sizeOfWidth,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.green, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: selectedFile.isNull && widget.imageUrl.isNull
                ? Center(
                    child: IconButton(
                      onPressed: () async => await _capture(),
                      icon: const Icon(Icons.add_a_photo, size: 64, color: AppColors.green),
                    ),
                  )
                : ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                    child: selectedFile,
                ),
          ),
          if(!widget.readOnly)...[
            AppButton(
              onPressed: selectedFile.isNotNull ? () async => await _capture() : null,
              margin: const EdgeInsets.all(12.0),
              label: 'Retake',
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _capture() async {
    final capturedFile = await captureImage();
    if(capturedFile != null) {
      setState(() {
        selectedFile = Image.file(capturedFile, fit: BoxFit.fitHeight);
      });
      widget.onFileCapture(capturedFile);
    }
  }
}

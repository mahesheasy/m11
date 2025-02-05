import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UpdateWeightWidget extends StatefulWidget {
  const UpdateWeightWidget({super.key, required this.title, this.defaultVal});

  final String title;
  final double? defaultVal;

  static Future<double?> openDialog(
      BuildContext context, String title, double? defaultVal) async {
    final enteredString = await showDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return UpdateWeightWidget(
          title: title,
          defaultVal: defaultVal,
        );
      },
    );
    return double.tryParse(enteredString.valueOrEmpty);
  }

  @override
  State<UpdateWeightWidget> createState() => _UpdateWeightWidgetState();
}

class _UpdateWeightWidgetState extends State<UpdateWeightWidget> {
  final weightCtlr = TextEditingController();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    weightCtlr.text = NumUtils.toStrVal(widget.defaultVal);
  }

  void _validateInput(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorText = 'Please enter a number';
      } else {
        final number = double.tryParse(value);
        if (number == null) {
          _errorText = 'Please enter a valid number';
        } else if (number < 0 || number > 30) {
          _errorText = 'Number must be between 0 and 30';
        } else {
          _errorText = null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          Expanded(child: Text(widget.title)),
          IconButton(
            onPressed: context.exit,
            icon: const Icon(Icons.close, color: AppColors.red),
          )
        ],
      ),
      titleTextStyle: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: TextFormField(
        controller: weightCtlr,
        autofocus: true,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          labelStyle: context.textTheme.labelMedium,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          suffixIcon: IconButton(
            onPressed: () {
              weightCtlr.clear();
              _errorText = null;
            },
            icon: const Icon(Icons.close),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1, color: AppColors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1, color: AppColors.green),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 1, color: AppColors.green),
          ),
          labelText: 'Enter a weight between 0 and 30',
          errorText: _errorText,
        ),
        onChanged: _validateInput,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a number';
          }
          final number = double.tryParse(value);
          if (number == null) {
            return 'Please enter a valid number';
          }
          if (number < 0 || number > 30) {
            return 'Weight must be between 0 and 30';
          }
          return null;
        },
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.haintBlue,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.haintBlue),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          onPressed: () {
            if (_errorText == null) {
              context.exit(weightCtlr.text);
            } else {
              context.showSnackbar(
                  'Enter a weight between 0 and 30', AppSnackBarType.error);
            }
          },
          child: Text(
            'UPDATE',
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class GSTInField extends StatefulWidget {
  GSTInField({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.readOnly = false,
    this.helperText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.autofocus = false,
    TextEditingController? controller,
    this.isRequired = false,
  }) {
    this.controller = controller ?? TextEditingController();
    if (initialValue?.isNotEmpty == true) {
      this.controller?.text = initialValue!;
    }
  }

  final String title;
  final String? initialValue;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;
  final bool readOnly;
  final String? helperText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  late final TextEditingController? controller;
  final bool autofocus;
  final bool isRequired;

  @override
  State<GSTInField> createState() => _GSTInFieldState();
}

class _GSTInFieldState extends State<GSTInField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _numeric = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller ?? TextEditingController();
  }

  void _switch() {
    _focusNode.unfocus();
    setState(() {
      _numeric = !_numeric;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Future.delayed(const Duration(milliseconds: 350)).then((value) {
          FocusScope.of(context).requestFocus(_focusNode);
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(color: AppColors.green),
    );

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        CaptionText(title: widget.title, isRequired: widget.isRequired),
        TextField(
          focusNode: _focusNode,
          enableInteractiveSelection: false,
          controller: _controller,
          decoration: InputDecoration(
            border: textFieldBorder,
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder,
            contentPadding: const EdgeInsets.all(16.0),
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            counterText: '',
          ),
          maxLength: 15,
          inputFormatters: [UpperCaseTextFormatter()],
          textInputAction: TextInputAction.done,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          onChanged: (value) {
            if (widget.onChanged.isNotNull) {
              widget.onChanged!(value);
            }

            final strlength = value.length;
            if(strlength < 2) {
              if(_numeric.isFalse) {
                _switch();
              }
            } else if(strlength == 2) {
              if(_numeric.isTrue) {
                _switch();
              }
            } else if(strlength > 2 && strlength < 7) {
              if(_numeric.isTrue) {
                _switch();
              }
            }  else if(strlength >= 7 && strlength < 11) {
              if(_numeric.isFalse) {
                _switch();
              }
            }  else if(strlength == 11) {
              if(_numeric.isTrue) {
                _switch();
              }
            }  else if(strlength == 12) {
              if(_numeric.isFalse) {
                _switch();
              }
            } else if(strlength == 13) {
              if(_numeric.isTrue) {
                _switch();
              }
            } else if(strlength > 13) {
              if(_numeric.isTrue) {
                _switch();
              }
            }
          },
          onSubmitted: widget.onSubmitted,
          textCapitalization: TextCapitalization.none,
          readOnly: widget.readOnly,
          autocorrect: false,
          keyboardType: _numeric
              ? const TextInputType.numberWithOptions(decimal: false, signed: false)
              : TextInputType.text,
          autofocus: widget.autofocus,
        ),
      ],
    );
  }
}

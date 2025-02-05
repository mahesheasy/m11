import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';


class BankIFSCField extends StatefulWidget {
  BankIFSCField({
    super.key,
    required this.title,
    this.hintText,
    required this.onChanged,
    required this.onSubmit,
    this.isReadonly = false,
    TextEditingController? controller,
    this.enabled = true,
    this.isMandatory = false,
    this.prefixIcon,
    this.suffixIcon, 
    this.initialValue,
  }) {
    this.controller = controller ?? TextEditingController();
    if (initialValue?.isNotEmpty == true) {
      this.controller?.text = initialValue!;
    }
  }


  final String title;
  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  late final TextEditingController? controller;
  final bool isReadonly;
  final bool enabled;
  final bool isMandatory;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<BankIFSCField> createState() => _BankIFSCFieldState();
}

class _BankIFSCFieldState extends State<BankIFSCField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _numeric = false;

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: AppColors.green),
    );

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        if (widget.title.containsValidValue) ...[
          CaptionText(title: widget.title, isRequired: widget.isMandatory),
        ],
        TextField(
          enableInteractiveSelection: false,
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            border: textFieldBorder,
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder,
            contentPadding: const EdgeInsets.all(16.0),
            suffixIcon: widget.suffixIcon,
            counterText: '',
          ),
          inputFormatters: [
            UpperCaseTextFormatter(),
          ],
          onChanged: (value) {
            if (widget.onChanged != null) widget.onChanged!(value);
        
            final strlength = value.length;
            if (strlength < 4) {
              if (_numeric.isTrue) {
                _switch();
              }
            } else if (strlength >= 4 && strlength < 11) {
              if (_numeric.isFalse) {
                _switch();
              }
            }
          },
          onSubmitted: widget.onSubmit,
          keyboardType: _numeric
              ? const TextInputType.numberWithOptions(
                  decimal: false, signed: false)
              : TextInputType.text,
          autocorrect: false,
          maxLength: 11,
          obscureText: false,
        ),
      ],
    );
  }

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
}

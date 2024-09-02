import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class HTSPasswordField extends StatefulWidget {
  const HTSPasswordField({
    super.key,
    this.textStyle,
    this.width,
    this.labelSpace = 3,
    this.textCapitalization = TextCapitalization.sentences,
    this.padding = const SizedBox(height: 24),
    this.onTap,
    this.decoration,
    this.hintStyle,
    this.backgroundColor,
    this.isLoading = false,
    this.readOnly = false,
    this.customLabel,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.obscureText = true,
    this.enabled = true,
    this.validateFunction,
    this.borderSide = BorderSide.none,
    this.onSaved,
    this.onChange,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.inputFormatters,
    this.borderRadius = 5,
    this.initialValue,
    this.labelSize,
    this.labelColor,
    this.errorMessage,
    this.bottomLabel,
    this.prefix,
  });
  final double? width;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved;
  final void Function(String)? onChange;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? autofocus;
  final String? label;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading;
  final bool readOnly;
  final double borderRadius;
  final double labelSpace;
  final String? initialValue;
  final Widget? customLabel;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final Widget padding;
  final TextCapitalization textCapitalization;
  final String? errorMessage;
  final Widget? bottomLabel;
  final Widget? prefix;

  @override
  State<HTSPasswordField> createState() => _HTSPasswordFieldState();
}

class _HTSPasswordFieldState extends State<HTSPasswordField> {
  String? error;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.authFieldBorderColor,
            ),
          ),
          child: TextFormField(
            key: widget.key,
            textCapitalization: widget.textCapitalization,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            textAlign: TextAlign.left,
            inputFormatters: widget.inputFormatters,
            autofocus: widget.autofocus ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled,
            validator: widget.validateFunction,
            obscureText: obscure,
            onSaved: (val) {
              error = widget.validateFunction!(val);
              setState(() {});
              widget.onSaved?.call(val!);
            },
            onChanged: (val) {
              widget.validateFunction != null
                  ? error = widget.validateFunction!(val)
                  : error = null;
              setState(() {});
              if (widget.onChange != null) widget.onChange!.call(val);
            },
            style: widget.textStyle ??
                TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                ),
           // cursorColor: AppColors.primarySwatch,
            maxLines: widget.maxLines,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: widget.decoration ??
                InputDecoration(
                  //fillColor: widget.backgroundColor,
               
                  prefix: widget.prefix,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(
                      () {
                        obscure = !obscure;
                      },
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/${!obscure ? "eye-slash" : "eye"}.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  enabled: false,
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                ),
          ),
        ),
        Stack(
          children: [
            if (error != null || widget.errorMessage != null) ...[
              5.hSpace,
              Text(
                widget.errorMessage ?? error!,
                style: const TextStyle(
                  color: AppColors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
        widget.padding,
      ],
    );
  }
}

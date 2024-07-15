
import 'package:flutter/material.dart';
import 'package:route_task/utils/app_colors.dart';

class FormFiledWidget extends StatelessWidget {
  const FormFiledWidget({
    Key? key,
    this.controller,
    this.type,
    required this.label,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.error,
    this.validator,
    this.suffixPressed,
    this.suffix,
    this.textArea = false,
    this.isPassword = false,
    this.textDirection,
    this.textInputAction,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? type;
  final String label;
  final Function(String value)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final String? error;
  final FormFieldValidator<String>? validator;
  final Function()? suffixPressed;
  final Widget? suffix;
  final bool textArea, isPassword;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onSubmitted: onSubmitted,
      textDirection: textDirection,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      controller: controller,
      minLines: textArea ? 5 : 1,
      maxLines: textArea ? 8 : 1,
      keyboardType: type,
      obscureText: isPassword,
      textInputAction: textInputAction ?? TextInputAction.go,
      onChanged: onChanged,

      decoration: InputDecoration(
        errorText: error,
        errorStyle: const TextStyle(fontSize: 14),
        hintText: hintText ?? '',
        hintTextDirection: textDirection,
        label: Text(label),
        labelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: AppColors.primary),
        hintStyle: const TextStyle(color: AppColors.primary, fontSize: 14),
        fillColor: Colors.white,
        alignLabelWithHint: true,
        // hintTextDirection: alignHint ?? TextDirection.ltr,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        filled: true,
        // fillColor: ColorManager.bkgTextInput,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.primary, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.primary, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.primary, width: 0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.primary, width: 0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.primary, width: 0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: AppColors.primary, width: 0),
        ),
    
        suffixIcon: suffix != null
            ? GestureDetector(onTap: suffixPressed, child: suffix
                //  Icon(
                //   suffix,
                //   color: kSecondary,
                // ),
                )
            : const SizedBox(),
      ),
    );
  }
}

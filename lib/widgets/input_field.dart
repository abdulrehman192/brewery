import 'package:flutter/services.dart';

import '/utils/colors.dart';
import 'package:flutter/material.dart';

class InputFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool? isPassword;
  final Widget? preIcon;
  final Widget? trailIcon;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final bool? enabled;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool? readOnly;
  final Color? borderColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  const InputFiled({super.key, required this.controller, this.hintText, this.isPassword, this.preIcon, this.trailIcon, this.keyboard, this.labelText, this.validator, this.maxLines, this.enabled, this.onTap, this.onChanged, this.readOnly, this.borderColor, this.labelColor, this.hintColor, this.textColor, this.maxLength, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ?? false,
        readOnly: readOnly ?? false,
        keyboardType: keyboard ?? TextInputType.text,
        cursorHeight: 25,
        validator: validator,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        enabled: enabled,
        onTap: onTap,
        inputFormatters: inputFormatters,
        style: TextStyle(color: textColor ?? Colors.black),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.grey),
          prefixIcon: preIcon,
          suffixIcon: trailIcon,
          label: labelText != null ? Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(labelText ?? "", style: TextStyle(color: labelColor ?? AppColors.primaryColor),),
          ): null,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? AppColors.primaryColor),
            gapPadding: 0,
            borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.primaryColor),
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8)
      ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppColors.primaryColor),
              gapPadding: 0,
              borderRadius: BorderRadius.circular(8)
          )
        ),
      ),
    );
  }
}

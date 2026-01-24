import 'package:e_commerce_app_ui/utils/app_textst.dart';
import 'package:flutter/material.dart';

class CustomTextfiled extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardTybe;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextfiled({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.keyboardTybe = TextInputType.text,
    this.controller,
    this.validator,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  State<CustomTextfiled> createState() => _CustomTextfiledState();
}

class _CustomTextfiledState extends State<CustomTextfiled> {
  bool _obscuerText = true;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscuerText,
      keyboardType: widget.keyboardTybe,
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: AppTextst.withColor(
        AppTextst.bodymedium,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextst.withColor(
          AppTextst.bodymedium,
          isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscuerText = !_obscuerText;
                  });
                },
                icon: Icon(
                  _obscuerText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/core/responsive/extensions.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon, size: 18.sp) : const SizedBox(),
      label: Text(title),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 14.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}

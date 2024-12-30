import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class PreviewScreenBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const PreviewScreenBtn({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.buttonText),
        onPressed: onPressed,
      ),
    );
  }
}

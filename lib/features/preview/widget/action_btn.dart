import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class ActionBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const ActionBtn({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton.icon(
        icon: Icon(text == "Save to Folder" ? Icons.save : Icons.camera_alt,
            size: 32, color: AppColors.buttonText),
        label: Text(text, style: const TextStyle(color: AppColors.buttonText)),
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

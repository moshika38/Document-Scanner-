import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class DeletePopup {
  static void deleteImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Image',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.descriptionText,
                fontSize: 24,
              ),
        ),
        content: Text(
          'Are you sure you want to delete this Document?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.descriptionText,
                fontSize: 18,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: AppColors.primary)),
          ),
          TextButton(
            onPressed: () {
              File(imagePath).deleteSync();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Delete',
                style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
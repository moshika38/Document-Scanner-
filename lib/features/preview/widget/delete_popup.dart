import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/services/document_services.dart';

class DeletePopup {
  void deleteImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Document',
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
            onPressed: () {
              // Pop the current dialog
              Navigator.of(context).pop();
            },
            child: const Text('Cancel',
                style: TextStyle(color: AppColors.primary)),
          ),
          TextButton(
            onPressed: () {
              // Delete the image and then pop the dialog
              DocumentServices().deletePdf(context, imagePath);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Delete',
                style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}

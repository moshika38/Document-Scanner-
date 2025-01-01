import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/services/document_services.dart';
import 'package:provider/provider.dart';

class DeletePopup {
  void deleteImage(BuildContext context, String imagePath, bool isPop) {
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
          Consumer<DocumentServices>(
            builder: (context, docServices, child) => TextButton(
              onPressed: () {
                // Delete the image and then pop the dialog
                docServices.deletePdf(context, imagePath);

                Navigator.of(context).pop();
                isPop?Navigator.of(context).pop():null;
              },
              child: const Text('Delete',
                  style: TextStyle(color: AppColors.primary)),
            ),
          ),
        ],
      ),
    );
  }
}

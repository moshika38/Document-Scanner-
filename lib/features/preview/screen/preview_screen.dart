import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_application_1/core/utils/color.dart';

class PreviewScreen extends StatefulWidget {
  final String imagePath;

  const PreviewScreen({
    super.key,
    required this.imagePath,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  void _shareImage() {
    // Share.shareFiles([widget.imagePath]);
  }

  void _deleteImage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Image'),
        content: const Text('Are you sure you want to delete this image?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              File(widget.imagePath).deleteSync();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Preview',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.buttonText,
                  fontSize: 24,
                )),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.buttonText),
            onPressed: () {
              // Navigate to edit screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.buttonText),
            onPressed: _shareImage,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.buttonText),
            onPressed: _deleteImage,
          ),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.buttonText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String imagePath;
  final String pdfPath;

  const PreviewPage({required this.imagePath, required this.pdfPath});

  Future<void> deleteImage(BuildContext context) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image deleted successfully')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File not found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting file: $e')),
      );
    }
  }

  Future<void> deletePdf(BuildContext context) async {
    try {
      final file = File(pdfPath);
      if (await file.exists()) {
        await file.delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PDF deleted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PDF not found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Document'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath.isNotEmpty)
            Image.file(File(imagePath))
          else
            const Text('No image captured'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => deleteImage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Delete Image'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => deletePdf(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Delete PDF'),
          ),
        ],
      ),
    );
  }
}

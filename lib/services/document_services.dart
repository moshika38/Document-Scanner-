import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/snack_bar.dart';
import 'package:flutter_application_1/features/preview/screen/preview_screen.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';

class DocumentServices {
  final DocumentScanner _documentScanner =
      DocumentScanner(options: DocumentScannerOptions());

// scan new document
  Future<void> scanDocument(BuildContext context) async {
    try {
      final result = await _documentScanner.scanDocument();
      if (result.images.isNotEmpty) {
        // Use the first image path from the result
        final firstImagePath = result.images.first;

        // Save the image as a PDF
        final pdfPath = await _saveAsPdf(firstImagePath);
        await deleteImage(firstImagePath);

        // Navigate to the preview page with the PDF path
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PreviewScreen( pdfPath: pdfPath),
            ),
          );
          CustomSnackBar.showSuccess(context, "Document scanned successfully");
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, "Error: $e");
      }
    }
  }

  // save as pdf
  Future<String> _saveAsPdf(String imagePath) async {
    try {
      final pdf = pw.Document();

      final image = pw.MemoryImage(File(imagePath).readAsBytesSync());
      pdf.addPage(pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Image(image),
        ),
      ));

      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (await downloadsDir.exists()) {
        final pdfPath = '${downloadsDir.path}/${_documentScanner.id}.pdf';
        final file = File(pdfPath);

        await file.writeAsBytes(await pdf.save());

        return pdfPath;
      } else {
        throw Exception('Downloads directory not found');
      }
    } catch (e) {
      throw Exception('Failed to save PDF: $e');
    }
  }

  // delete image
  Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print("Error deleting image: $e");
    }
  }

  // delete Pdf
  Future<void> deletePdf(BuildContext context, String pdfPath) async {
    try {
      final file = File(pdfPath);
      if (await file.exists()) {
        await file.delete();

        if (context.mounted) {
          CustomSnackBar.showSuccess(context, "Document deleted successfully");
        }
      } else {
        if (context.mounted) {
          CustomSnackBar.showError(context, "Document not found");
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, "Error deleting Document: $e");
      }
    }
  }

  // rename doc name
  Future<void> renameFile(
      BuildContext context, String filePath, String newName) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        final directory = file.parent.path;
        final newFilePath = '$directory/$newName';
        await file.rename(newFilePath);
        if (context.mounted) {
          CustomSnackBar.showSuccess(context, "Document renamed successfully");
        }
      } else {
        if (context.mounted) {
          CustomSnackBar.showError(context, "Document not found");
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, "Error renaming Document: $e");
      }
    }
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/preview_page.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:pdf/widgets.dart' as pw;

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final DocumentScanner _documentScanner =
      DocumentScanner(options: DocumentScannerOptions());

  Future<String> _saveAsPdf(String imagePath) async {
    try {
      // Create a PDF document
      final pdf = pw.Document();

      // Add the image to the PDF
      final image = pw.MemoryImage(File(imagePath).readAsBytesSync());
      pdf.addPage(pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Image(image),
        ),
      ));

      // Get the Downloads directory
      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (await downloadsDir.exists()) {
        final pdfPath = '${downloadsDir.path}/${_documentScanner.id}.pdf';
        final file = File(pdfPath);

        // Save the PDF file
        await file.writeAsBytes(await pdf.save());
        return pdfPath;
      } else {
        throw Exception('Downloads directory not found');
      }
    } catch (e) {
      throw Exception('Failed to save PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final result = await _documentScanner.scanDocument();
              if (result.images.isNotEmpty) {
                // Use the first image path from the result
                final firstImagePath = result.images.first;

                // Save the image as a PDF
                final pdfPath = await _saveAsPdf(firstImagePath);

                // Navigate to the preview page with the PDF path
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewPage(
                        imagePath: firstImagePath, pdfPath: pdfPath),
                  ),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          },
          child: const Text('Scan Document'),
        ),
      ),
    );
  }
}

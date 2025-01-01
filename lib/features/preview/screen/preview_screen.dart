import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/end_drawer.dart';
import 'package:flutter_application_1/features/widget/delete_popup.dart';
import 'package:flutter_application_1/features/preview/widget/preview_screen_btn.dart';
import 'package:flutter_application_1/features/preview/widget/rename.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PreviewScreen extends StatefulWidget {
  final String pdfPath;

  const PreviewScreen({
    super.key,
    required this.pdfPath,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const EndDrawer(),
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Preview',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.buttonText,
                  fontSize: 20,
                )),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings, color: AppColors.buttonText),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              }),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.buttonText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PreviewScreenBtn(
            icon: Icons.edit,
            onPressed: () {
              Rename.renameDoc(context);
            },
          ),
          PreviewScreenBtn(
            icon: Icons.delete,
            onPressed: () {
              DeletePopup().deleteImage(context, widget.pdfPath, true);
            },
          ),
          PreviewScreenBtn(
            icon: Icons.share,
            onPressed: () {
               
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              child: widget.pdfPath != ""
                  ? PDFView(
                      filePath: widget.pdfPath,
                      
                    )
                  : const Center(
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 5,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

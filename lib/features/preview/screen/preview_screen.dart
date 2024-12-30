import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/end_drawer.dart';
import 'package:flutter_application_1/features/preview/widget/delete_popup.dart';
import 'package:flutter_application_1/features/preview/widget/preview_screen_btn.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _shareImage() {
    // Share.shareFiles([widget.imagePath]);
  }

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
                  fontSize: 24,
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
          icon:
              const Icon(Icons.arrow_back_ios_new, color: AppColors.buttonText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PreviewScreenBtn(
            icon: Icons.edit,
            onPressed: () {},
          ),
          PreviewScreenBtn(
            icon: Icons.delete,
            onPressed: () {
              DeletePopup.deleteImage(context, widget.imagePath);
            },
          ),
          PreviewScreenBtn(
            icon: Icons.share,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              child: widget.imagePath != ""
                  ? Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.contain,
                    )
                  : const Center(
                      child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 5,
                      ),
                    )),
            ),
          ),
        ],
      ),
    );
  }
}

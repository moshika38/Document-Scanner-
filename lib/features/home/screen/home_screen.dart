import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/cate_card.dart';
import 'package:flutter_application_1/features/home/widget/doc_card.dart';
import 'package:flutter_application_1/features/home/widget/end_drawer.dart';
import 'package:flutter_application_1/features/home/widget/folder.dart';
import 'package:flutter_application_1/features/home/widget/headline.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const EndDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'Doc Scanner',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.buttonText,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.buttonText),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.titleText,
                      ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CateCard.buildCategoryCard(
                        context, 'PDF', Icons.picture_as_pdf, Colors.red),
                    CateCard.buildCategoryCard(
                        context, 'Word', Icons.description, Colors.blue),
                    CateCard.buildCategoryCard(
                        context, 'Images', Icons.image, Colors.green),
                  ],
                ),

                // Folders Section
                const SizedBox(height: 24),

                const Headline(isIcon: true, title: 'Folders'),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Folder(
                      index: index,
                    );
                  },
                ),

                // Recent Scans Section
                const SizedBox(height: 24),

                const Headline(isIcon: false, title: 'Recent Scans'),

                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const DocCard();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(
          Icons.document_scanner,
          color: AppColors.buttonText,
          size: 32,
        ),
      ),
    );
  }
}

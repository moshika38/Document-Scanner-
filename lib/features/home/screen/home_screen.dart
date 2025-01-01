import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/doc_card.dart';
import 'package:flutter_application_1/features/home/widget/end_drawer.dart';
import 'package:flutter_application_1/features/preview/screen/preview_screen.dart';
import 'package:flutter_application_1/models/doc_model.dart';
import 'package:flutter_application_1/features/home/services/document_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const EndDrawer(),
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.buttonText),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
        backgroundColor: AppColors.primary,
        title: Text(
          'Doc Scanner',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.buttonText,
                fontSize: 20,
              ),
        ),
        elevation: 0,
      ),
      body: Consumer<DocumentServices>(builder: (context, docServices, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildScanButton(context),
              SizedBox(
                height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "Recent  ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: docServices.getPdfFiles(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 6,
                            ),
                          ),
                        ),
                      );             
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      final files = snapshot.data as List<DocModel>;
                      return ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PreviewScreen(
                                    pdfPath: files[index].path,
                                  ),
                                ),
                              );
                            },
                            child: DocCard(docModel: files[index]),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "No documents found",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DocumentServices>().scanDocument(context);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.document_scanner, color: AppColors.buttonText),
      ),
    );
  }

  Widget _buildScanButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            context.read<DocumentServices>().scanDocument(context);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add_a_photo,
                    size: 50, color: AppColors.primary),
                const SizedBox(width: 15),
                Text(
                  'Scan New Document',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

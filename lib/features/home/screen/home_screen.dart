import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/doc_card.dart';
import 'package:flutter_application_1/features/home/widget/end_drawer.dart';
import 'package:flutter_application_1/features/preview/screen/preview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                fontSize: 24,
              ),
        ),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.buttonText,
          labelColor: AppColors.buttonText,
          unselectedLabelColor: AppColors.buttonText.withOpacity(0.4),
          tabs: const [
            Tab(text: 'Recent Scans'),
            Tab(text: 'Favorites'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRecentScansTab(),
          _buildFavoritesTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add scan document functionality
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PreviewScreen(
                imagePath: "",
              ),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.document_scanner, color: AppColors.buttonText),
      ),
    );
  }

  Widget _buildRecentScansTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildScanButton(context),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return DocCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return DocCard();
        },
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
            // Add scan functionality
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_a_photo, size: 50, color: AppColors.primary),
                const SizedBox(width: 15),
                Text(
                  'Scan New Document',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

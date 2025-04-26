import 'package:flutter/material.dart';
import 'package:foton/models/asset_thumbnail.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<AssetEntity> entities = [];
  Future<void> _fetchData() async {
    entities = await PhotoManager.getAssetListRange(start: 0, end: 10000);
    setState(() {});
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDCC8),
      appBar: AppBar(
        title: Text('Foton'),
        foregroundColor: Color(0xFF9E7462),
        backgroundColor: Color(0xFFFDDCC8),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: entities.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AssetThumbnail(entity: entities[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

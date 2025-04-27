import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foton/pages/image_view.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({super.key, required this.entity});

  final AssetEntity entity;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: entity.thumbnailData.then((value) => value!),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return const CircularProgressIndicator();
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ImageView(aEntity: entity)),
            );
          },
          child: Image.memory(bytes, fit: BoxFit.cover),
        );
      },
    );
  }
}

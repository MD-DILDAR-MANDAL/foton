import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foton/pages/image_view.dart';
import 'package:foton/pages/video_view.dart';
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
        if (bytes == null) return Icon(Icons.hourglass_empty);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  if (entity.type == AssetType.image) {
                    return ImageView(aEntity: entity);
                  } else if (entity.type == AssetType.video) {
                    return VideoView(aEntity: entity);
                  } else {
                    return SizedBox(height: 0.0);
                  }
                },
              ),
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.memory(bytes, fit: BoxFit.cover),
              if (entity.type == AssetType.video)
                Center(
                  child: Container(
                    color: Colors.blue,
                    child: const Icon(Icons.play_arrow, color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

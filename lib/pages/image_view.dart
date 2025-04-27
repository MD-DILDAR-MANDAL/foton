import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.aEntity});
  final AssetEntity aEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Foton'),
        foregroundColor: Color(0xFFFDDCC8),
        backgroundColor: Color(0xFF000000),
      ),
      body: FutureBuilder(
        future: aEntity.file.then((value) => value!),
        builder: (_, snapshot) {
          final file = snapshot.data;
          if (file == null) return Container();
          return Column(
            children: [
              Expanded(
                child: PhotoView(
                  imageProvider: FileImage(file),
                  enableRotation: true,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${aEntity.title}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFDDCC8),
                    ),
                  ),
                  Text(
                    "${aEntity.createDateTime}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFDDCC8),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

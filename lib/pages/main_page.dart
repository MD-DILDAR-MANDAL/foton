import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:foton/routes/routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool hasPermission = false;
  @override
  void initState() {
    super.initState();
    PhotoManager.requestPermissionExtend().then((value) {
      if (value.hasAccess) {
        hasPermission = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDDCC8),
      appBar: AppBar(
        title: Text('Foton'),
        foregroundColor: Color(0xFF9E7462),
        backgroundColor: Color(0xFFFDDCC8),
        leading: Icon(Icons.menu),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  PhotoManager.requestPermissionExtend().then((value) {
                    if (value.isAuth) {
                      Navigator.of(context).pushNamed(RouteManager.gallery);
                    } else if (value.hasAccess) {
                      Navigator.of(context).pushNamed(RouteManager.gallery);
                    }
                  });
                },
                child: Text('Grant Permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

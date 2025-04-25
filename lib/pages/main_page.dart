import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:foton/routes/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                  final PermissionState ps =
                      await PhotoManager.requestPermissionExtend();
                  // the method can use optional param `permission`.
                  if (ps.isAuth) {
                    Navigator.of(context).pushNamed(RouteManager.gallery);
                  } else if (ps.hasAccess) {
                    // Access will continue, but the amount visible depends on the user's selection.
                  } else {
                    PhotoManager.openSetting();
                    // Limited(iOS) or Rejected, use `==` for more precise judgements.
                    // You can call `PhotoManager.openSetting()` to open settings for further steps.
                  }
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

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:foton/routes/routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth || ps.hasAccess) {
      setState(() {
        _hasPermission = true;
      });
      Navigator.of(context).popAndPushNamed(RouteManager.gallery);
    } else {
      setState(() {
        _hasPermission = false;
      });
    }
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
        child:
            _hasPermission
                ? CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () {
                    PhotoManager.openSetting();
                  },
                  child: Text('Grant Permission'),
                ),
      ),
    );
  }
}

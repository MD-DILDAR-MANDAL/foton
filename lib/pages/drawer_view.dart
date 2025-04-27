import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF9E7462),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/icon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Thanks for using this app',
              style: TextStyle(fontSize: 16, color: Color(0xFFFDDCC8)),
            ),
            const SizedBox(height: 40),
            const Text(
              'Visit \n Galactic Market \n (https://irozer.github.io) \n for more...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFDDCC8),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Free Thought Free World',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Color(0xFFFDDCC8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game Over',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Главное меню',
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

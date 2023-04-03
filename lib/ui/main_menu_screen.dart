import 'dart:io';

import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Начать игру'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Выбор уровня'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Выбор сложности'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Настройки'),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 400,
              height: 100,
              child: ElevatedButton(
                onPressed: () => exit(0),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text('Выход'),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

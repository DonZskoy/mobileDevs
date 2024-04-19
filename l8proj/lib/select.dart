import 'package:flutter/material.dart';
import 'package:l8proj/main.dart';

class Select extends StatelessWidget {
  const Select({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Выберите раздел'),
        ),
        // backgroundColor: Colors.white70,
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 150)),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/photo');
                    },
                    child: const Text('Фотогалерея',
                      style: TextStyle(fontSize: 32,
                      color: Colors.green)))),
            const Padding(padding: EdgeInsets.only(top: 100)),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/news');
                    },
                    child: const Text('Новости КубГАУ',
                      style: TextStyle(fontSize: 30,
                      color: Colors.green)))),
          ],
        ));
  }
}

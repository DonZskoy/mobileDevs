
import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Список элементов')),
        body: ListView(
          children: const [
            Text('0000'),
            Divider(),
            Text('0001'),
            Divider(),
            Text('0010'),
          ],
        ));
  }
}
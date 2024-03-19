import 'package:flutter/material.dart';

class InfinityList extends StatelessWidget {
  const InfinityList({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text('Список элементов')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text('Строка $index');
          },
        ));
  }
}
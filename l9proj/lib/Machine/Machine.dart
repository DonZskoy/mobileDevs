import 'package:flutter/material.dart';
import 'package:l9proj/classes/class_machine.dart';

class MachinePage extends StatefulWidget {
  const MachinePage({super.key});

  @override
  State<MachinePage> createState() => _MachinePageState();
}

var coffe = Machine(coffeBeans: 500, milk: 150, water: 450, cash: 75);
String text = 'dick';

class _MachinePageState extends State<MachinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Кофемашина'),
        ),
        body: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      text = coffe.makingCoffee();
                      setState(() {});
                    },
                    child: const Text('Приготовить кофе')),
                Text(text),
          ],
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:l9proj/classes/class_machine.dart';

class MachinePage extends StatefulWidget {
  const MachinePage({super.key});

  @override
  State<MachinePage> createState() => _MachinePageState();
}

String text = '';
var coffe = Machine(coffeBeans: 250, milk: 200, water: 460, cash: 75);

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
                const Padding(padding: EdgeInsets.only(top: 30)),
                Text(text),
          ],
        )));
  }
}

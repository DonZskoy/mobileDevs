import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'l4proj',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    void initState() {
      super.initState();
      loadAsset();
      }
    
      String _fileContents = "";

      Future<void> loadAsset() async {
        String fileText = await rootBundle.loadString('assets/text.txt');
        setState(() {
          _fileContents = fileText;
      });
    }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Image.asset('assets/obshaga.png'),
          Row(
            children: [
              Flexible(child: Text(_fileContents)),
            ],
          ),
        ]
      )
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String imageAsset = 'assets/obshaga.png';

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
  int _likeCounter = 18;
  bool isLiked = true;

  Future<void> loadAsset() async {
    String fileText = await rootBundle.loadString('assets/text.txt');
    setState(() {
      _fileContents = fileText;
    });
  }

  _callNumber() async {
    const number = '79002384654'; //set the number here
    return await FlutterPhoneDirectCaller.callNumber(number);
  }

  _buildRoute() async {
    MapsLauncher.launchQuery(
        'Краснодар, улица Калинина 13, корпус 20, Общежитие 20');
  }

  Future<void> _share() async {
    final image = await rootBundle.load('assets/obshaga.png');
    final buffer = image.buffer;
    Share.shareXFiles([
      XFile.fromData(
          buffer.asUint8List(
              image.offsetInBytes,
              image.lengthInBytes
          ),
        mimeType: 'image/png'
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Image.asset('assets/obshaga.png'),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(5.0),
                                      child: const Text("Общежитие №20")
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                        "Краснодар, ул. Калинина 13к20"),),
                                ],
                              ))),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : null,
                            ),
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                                if (isLiked) {
                                  _likeCounter++;
                                } else {
                                  _likeCounter--;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Text(_likeCounter.toString()),
                    ]),
                    Container(
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: _callNumber, child: Text('Позвонить')),
                            TextButton(
                                onPressed: _buildRoute, child: Text('Маршрут')),
                            TextButton(
                              onPressed: _share,
                              child: Text('Поделится'),
                            )
                          ],
                        )),
                    Flexible(child: Text(_fileContents)),
                  ]),
            ),
          ],
        ));
  }
}

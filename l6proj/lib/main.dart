import 'package:flutter/material.dart';

void main() { runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'l6proj',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Калькулятор площади'),
          backgroundColor: Colors.blue,
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  String _width = '';
  String _height = '';
  int _area = 0;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 25),
                  child:
                    Text('Введите данные для вычисления площади',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                      ),
                    ),
                ),
                Row(
                  children: <Widget>[
                    const Expanded(
                        flex: 2,
                        child:
                            Padding(padding: EdgeInsets.only(left: 15,top: 25),
                              child:
                                Text('Длина(мм):', style: TextStyle(fontSize: 15),),
                              ),
                            ),
                    Expanded(
                        flex: 5,

                        child:
                        TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Введите длину!';
                                }
                                  _width = value;
                                  return null;
                              },
                            ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child:
                      Padding(padding: EdgeInsets.only(left: 15,top: 25),
                        child:
                        Text('Ширина(мм):', style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    Expanded(
                      flex: 5,

                      child:
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите ширину!';
                          }
                          _height = value;
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _area = int.parse(_width) * int.parse(_height);
                          text = 'S = $_width * $_height = $_area';
                          }
                        );
                      }
                    },
                    child: const Text('Вычислить'),
                ),
              ),
              Text(_area == null ? 'задайте параметры' : text, style: const TextStyle(fontSize: 30),)
            ],
          ),
    );
  }
}

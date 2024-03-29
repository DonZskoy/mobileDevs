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
          title: const Text('Пробный вариант'),
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

  @override
  Widget build(BuildContext context) {
    return Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    const Expanded(
                        flex: 2,
                        child:
                            Padding(padding: EdgeInsets.only(left: 15,top: 25),
                              child:
                                Text('Введите текст:', style: TextStyle(fontSize: 18),),
                              ),
                            ),
                    Expanded(
                        flex: 5,

                        child:
                        TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Введите текст!';
                                }
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Поздравляю! Вы ввели текст')),
                        );
                      }
                    },
                    child: const Text('Проверка'),
                ),
              ),
            ],
          ),
    );
  }
}

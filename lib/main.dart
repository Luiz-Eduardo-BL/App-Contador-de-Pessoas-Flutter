import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  static MyHomePage? of(BuildContext context) =>
      context.findAncestorStateOfType();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }

  void increment() {
    if (count <= 50) {
      setState(() {
        count++;
      });
    }
  }

  void zerar() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Pessoas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mudar o background da tela
        children: [
          const Text('Pode entrar na fila!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              )),
          Padding(
              padding: const EdgeInsets.all(40),
              child: Text(count.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: increment,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(30),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  child: const Text('+',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ),
              ],
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: zerar,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(30),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  child: const Text('Zerar',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ],
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: decrement,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(30),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  child: const Text('-',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}

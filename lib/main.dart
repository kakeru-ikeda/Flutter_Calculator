import 'package:flutter/material.dart';
import './keymap.dart';
import './calc.dart';
import './uicolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
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
  btnPushed(symbol, type) {
    final regBegin = RegExp(r'\(');
    final regAfter = RegExp(r'\)');
    // 成立しない左括弧<(>の数
    Calc.beginBracket = regBegin.allMatches(Calc.expression).length -
        regAfter.allMatches(Calc.expression).length;

    setState(() {
      Calc.validation(symbol, type);
    });
  }

  ifIcon(Object? object) {
    if (object.runtimeType != String) {
      return const Icon(Icons.backspace);
    } else {
      return Text(
        object.toString(),
        style: const TextStyle(fontSize: 28),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  UIColor.setTheme(UIColor.getTheme());
                  UIColor.resetColors(UIColor.getTheme());
                });
              },
              icon: const Icon(Icons.change_circle_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              color: UIColor.getTarget('field'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Text(
                      Calc.history,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 24,
                        color: UIColor.getTarget('fieldText'),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Text(
                            Calc.expression,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontSize: 48,
                              color: UIColor.getTarget('fieldText'),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Text(
                      Calc.status,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 14,
                        color: UIColor.getTarget('fieldText'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            color: UIColor.getTarget('numpad'),
            child: Column(
              children: [
                for (int i = 0; i < 5; i++)
                  Row(
                    children: <Widget>[
                      for (int j = 0; j < 4; j++)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(150, 80),
                                shape: const CircleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                foregroundColor: UIColor.getTarget('btnFore'),
                                backgroundColor: UIColor.setCommonColor(
                                    UIColor.getTheme(),
                                    Keymaps.keymap[i]![j]!['type']!),
                              ),
                              onPressed: () {
                                btnPushed(Keymaps.keymap[i]?[j]!['symbol'],
                                    Keymaps.keymap[i]![j]!['type']!);
                              },
                              child: ifIcon(Keymaps.keymap[i]?[j]!['symbol']!),
                            ),
                          ),
                        )
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

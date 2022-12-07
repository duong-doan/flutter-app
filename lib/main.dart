import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => ChangeBgAppbar();
}

class ChangeBgAppbar extends State<MyApp> {
  int count = 1;
  dynamic bgColorAppbar = Colors.pink;
  static Map<String, Color> colors = {
    "purple": Colors.purple,
    "yellow": Colors.yellow,
    "red": Colors.red,
    "orange": Colors.orange,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Doan App"),
        backgroundColor: bgColorAppbar,
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Select color change background Appbar",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          for (var i in colors.entries)
            BoxColor(
              text: i.key,
              color: i.value,
              getColor: (color) {
                debugPrint('color: $color');
                setState(() {
                  bgColorAppbar = color;
                });
              },
            ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "phone"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "book"),
        ],
      ),
    ));
  }
}

class BoxColor extends StatelessWidget {
  final String text;
  final Color color;
  final void Function(Color color) getColor;
  const BoxColor(
      {Key? key,
      required this.text,
      required this.color,
      required this.getColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {getColor(color)},
      child: Text(text,
          style: TextStyle(
              color: color, fontSize: 25, fontWeight: FontWeight.bold)),
    );
  }
}

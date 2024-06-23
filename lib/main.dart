import 'package:card/widgets/MyCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Colors.amber,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyCard(
              circleRadius: 100,
              circleOffset: const Offset(20, 0),
              minHeight: 200,
              text: 'Center is a layout widget. Cen xkx x kx m q d fs sl',
              // text:
              //     'Center is a layout widget. Cen xkx x kx m q d fs sl slks lk Center is a layout widget. Cen xkx x kx m q d fs sl slks lk  Center is a layout widget. Cen xkx x kx m q d fs sl slks lk  Center is a layout widget. Cen xkx x kx m q d fs sl slks lk  Center is a layout widget. Cen xkx x kx m q d fs sl slks lk  Center is a layout widget. Cen xkx x kx m q d fs sl slks lk ',
              contentPadding: const EdgeInsets.only(left: 10),
              image: Image.asset(
                'assets/images/img.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

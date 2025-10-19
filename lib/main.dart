<<<<<<< HEAD
import 'package:fitnessapp/binding.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';
import 'package:fitnessapp/rout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initapp();
=======
import 'package:flutter/material.dart';

void main() {
>>>>>>> dc1c4777af0363100d78f0efb1855b53feda1964
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return GetMaterialApp(
      initialBinding: Initialbinding(),
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      getPages: route,
      initialRoute: "/",
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
>>>>>>> dc1c4777af0363100d78f0efb1855b53feda1964
    );
  }
}

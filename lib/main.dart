import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 0;
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugDisableShadows,
      home: Scaffold(
        backgroundColor: x == 5 ? Colors.greenAccent : Colors.white,
        appBar: AppBar(
          title: Text(
            'Lottery App',
            style: TextStyle(
              color: x == 5 ? Colors.black : Colors.white,
            ),
          ),
          backgroundColor: x == 5 ? Colors.green : Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Lottery winning number is 5',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  color: x == 5
                      ? Colors.green.shade200
                      : Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: x == 5
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.card_giftcard_outlined,
                              color: Colors.green,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Hurray you have won the Lottery. Your number is $x',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Better Luck next time your number is $x\nTry again',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = random.nextInt(6);
            setState(() {});
          },
          backgroundColor: x == 5 ? Colors.green : Colors.blue,
          child: Icon(
            Icons.refresh,
            color: x == 5 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}

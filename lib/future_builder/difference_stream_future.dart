import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

/* FutureBuilder is used for one time response, like taking an image from Camera,
 getting data once from native platform like making an http request etc.
 On the other hand, StreamBuilder is used for fetching some data more than once,
 like listening for location update, playing a music, stopwatch, etc.*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilderTest(),
          const SizedBox(height: 35),
          StreamBuilderTest(),
        ],
      ),
    );
  }
}

class FutureBuilderTest extends StatelessWidget {
  // used by FutureBuilder
  Future<int> _calculateSquare(int num) async {
    await Future.delayed(const Duration(seconds: 3));
    return num * num;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<int>(
        future: _calculateSquare(10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              "FutureBuilder = ${snapshot.data}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class StreamBuilderTest extends StatelessWidget {
  int _count = 0; // used by StreamBuilder

  // used by StreamBuilder
  Stream<int> _stopwatch() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield _count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: _stopwatch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Text(
              "StreamBuilder = ${snapshot.data}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

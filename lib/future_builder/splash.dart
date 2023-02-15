import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Future<String> _future = Future<String>.delayed(
    const Duration(seconds: 4),
    () => '✅ Data Loaded',
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data); // output:Data Loaded
          return Scaffold(
            body: Center(
              child: Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 100),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: Colors.lightBlue,
            body: Center(
              child: Text(
                'Splash screen',
                style: TextStyle(fontSize: 70),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }
}

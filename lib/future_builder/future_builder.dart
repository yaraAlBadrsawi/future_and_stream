import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({Key? key}) : super(key: key);

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

/*
FutureBuilder can use in:
Splash screen
render widget after async operation
check the firebase connect
*/

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  late Future<int?> _value;
  int? randomNum;

  Future<int?> _getRandom() async {
    Random random = Random();
    await Future.delayed(const Duration(seconds: 3));
    // randomNum = random.nextInt(100);
    return randomNum;
    // if we want to make error to see result
    // throw 'Failed ';
  }

  @override
  void initState() {
    _value = _getRandom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: _value, //_getRandom(),
        builder: (_, snapshot) {
          /* connectionState :
          *  waiting => ProgressIndicator
          *  done => hasError=> error hasData => snapshot.data
          * */
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(
                (() {
                  if (snapshot.hasError) {
                    return '❌ Error: ${snapshot.error}';
                  } else if (snapshot.hasData) {
                    return snapshot.data.toString();
                  } else {
                    return 'Empty data';
                  }
                })(),
                style: const TextStyle(fontSize: 100),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Center(child: Text('State: ${snapshot.connectionState}'));
          }
        },
      ),
    ));
  }
}

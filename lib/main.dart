import 'package:flutter/material.dart';
import 'package:future_and_stream/future_builder/difference_stream_future.dart';
import 'package:future_and_stream/stream_builder/stream_builder_example.dart';
import 'future_builder/future_builder.dart';
import 'future_builder/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const StreamBuilderExample();
  }
}

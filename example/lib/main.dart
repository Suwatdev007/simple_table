import 'package:flutter/material.dart';

import 'package:simple_table/simple_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: SimpleTable<Map<String, dynamic>>(
            list: [
              {'topic': 'a', 'data': 'a1'},
              {'topic': 'b', 'data': 'b1'},
            ],
            columns: [
              SimpleData(topic: 'topic', data: (i, data) => data['topic']),
              SimpleData(
                  topic: 'data', data: (i, data) => data['data'], isSort: true),
            ],
            onRefresh: () async {
              return true;
            },
          )),
    );
  }
}

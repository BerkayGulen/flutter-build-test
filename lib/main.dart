import 'package:build_test_app/PageOne.dart';
import 'package:build_test_app/PageTwo.dart';
import 'package:build_test_app/components/BarcodScannerWidget.dart';
import 'package:build_test_app/components/Layout1.dart';
import 'package:flutter/material.dart';

import 'components/Home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => MyApp(),

    },
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(length: 2, child:  Scaffold(
    appBar: AppBar(
      title: Text("Build Test App"),
      centerTitle: true,
      bottom: TabBar(
        tabs: [
          Tab(text: "page 1",),
          Tab(text: "page 2",)

        ],
      ),
    ),
    body:TabBarView(
      children: [
        PageOne(),
        PageTwo(),
      ],
    ),
  )
  );
}

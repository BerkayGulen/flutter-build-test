import 'package:build_test_app/components/BarcodScannerWidget.dart';
import 'package:build_test_app/components/Home.dart';
import 'package:build_test_app/components/Layout1.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return(
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          BarcodScannerWidget(),
          Divider(height: 5,),
          Layout1(),
          Divider(height: 5,),
          Home(),
        ],
      ),
    )
    );
  }
}

import 'package:flutter/material.dart';

import 'DatePickerWidget.dart';

class Layout1 extends StatefulWidget {
  const Layout1({super.key});

  @override
  State<Layout1> createState() => _Layout1State();
}

class _Layout1State extends State<Layout1> {
  Set timeSelected = {};
  String _selectedCountry = 'USA';

  List<String> _countries = ['USA', 'Canada', 'UK', 'Australia'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'soru1',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            // FormDemo(),
            SegmentedButton(
              segments: const [
                ButtonSegment(
                  value: 'Week',
                  label: Text('1'),
                ),
                ButtonSegment(
                  value: 'Month',
                  label: Text('2'),
                ),
                ButtonSegment(
                  value: 'Year',
                  label: Text('3'),
                ),
                ButtonSegment(
                  value: '4',
                  label: Text('4'),
                ),
                ButtonSegment(
                  value: '5',
                  label: Text('5'),
                ),
              ],
              onSelectionChanged: (selected) {
                print('times: $selected');
                timeSelected = selected;
                setState(() {});
              },
              selected: timeSelected,
              emptySelectionAllowed: true,
            ),
            const DatePickerWidget(
              title: "Date Picker",
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              items: _countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCountry = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Country',
              ),
            ),

          ],
        ),
      ),
    );
  }
}

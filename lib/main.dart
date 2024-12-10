
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UnitConversionHome(),
    );
  }
}

class UnitConversionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unit Converter')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Length Conversion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LengthConverter()),
              );
            },
          ),
          ListTile(
            title: Text('Weight Conversion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeightConverter()),
              );
            },
          ),
          ListTile(
            title: Text('Temperature Conversion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TemperatureConverter()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  double input = 0;
  double result = 0;
  String unit = 'Meters to Kilometers';

  void convert() {
    setState(() {
      switch (unit) {
        case 'Meters to Kilometers':
          result = input / 1000;
          break;
        case 'Miles to Kilometers':
          result = input * 1.60934;
          break;
        default:
          result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Length Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: unit,
              onChanged: (value) => setState(() => unit = value!),
              items: [
                'Meters to Kilometers',
                'Miles to Kilometers',
              ].map((String unit) {
                return DropdownMenuItem(value: unit, child: Text(unit));
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter value'),
              keyboardType: TextInputType.number,
              onChanged: (value) => input = double.tryParse(value) ?? 0,
            ),
            ElevatedButton(onPressed: convert, child: Text('Convert')),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}

class WeightConverter extends StatefulWidget {
  @override
  _WeightConverterState createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  double input = 0;
  double result = 0;
  String unit = 'Kilograms to Pounds';

  void convert() {
    setState(() {
      switch (unit) {
        case 'Kilograms to Pounds':
          result = input * 2.20462;
          break;
        case 'Pounds to Kilograms':
          result = input / 2.20462;
          break;
        default:
          result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weight Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: unit,
              onChanged: (value) => setState(() => unit = value!),
              items: [
                'Kilograms to Pounds',
                'Pounds to Kilograms',
              ].map((String unit) {
                return DropdownMenuItem(value: unit, child: Text(unit));
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter value'),
              keyboardType: TextInputType.number,
              onChanged: (value) => input = double.tryParse(value) ?? 0,
            ),
            ElevatedButton(onPressed: convert, child: Text('Convert')),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double input = 0;
  double result = 0;
  String unit = 'Celsius to Fahrenheit';

  void convert() {
    setState(() {
      switch (unit) {
        case 'Celsius to Fahrenheit':
          result = (input * 9 / 5) + 32;
          break;
        case 'Fahrenheit to Celsius':
          result = (input - 32) * 5 / 9;
          break;
        default:
          result = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: unit,
              onChanged: (value) => setState(() => unit = value!),
              items: [
                'Celsius to Fahrenheit',
                'Fahrenheit to Celsius',
              ].map((String unit) {
                return DropdownMenuItem(value: unit, child: Text(unit));
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter value'),
              keyboardType: TextInputType.number,
              onChanged: (value) => input = double.tryParse(value) ?? 0,
            ),
            ElevatedButton(onPressed: convert, child: Text('Convert')),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}
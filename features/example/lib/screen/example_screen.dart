import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExampleScreen',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example Screen'),
        ),
        body: Center(
          child: Text('Users'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой первый экран Flutter'),
      ),
      body: Center(
        child: Text(
          'Привет, мир!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

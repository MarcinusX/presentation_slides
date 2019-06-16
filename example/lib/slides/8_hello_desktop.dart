import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class HelloDesktopSlide extends StatefulWidget {
  @override
  _HelloDesktopSlideState createState() => _HelloDesktopSlideState();
}

class _HelloDesktopSlideState extends State<HelloDesktopSlide> {
  int index = 0;
  final backgroundKey = GlobalKey<BackgroundWrapperState>();

  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Text(
            'Efekt?',
            style: TextStyle(
              fontSize: 80,
              color: Colors.blue.shade900,
            ),
          ),
          SizedBox(height: 40),
          Stack(
            children: <Widget>[
              Image.asset(
                'assets/mac.png',
                width: 1000,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                left: 65,
                right: 65,
                top: 65,
                height: 490,
                child: MyHomePage(),
              )
            ],
          ),
        ],
      ),
      onPrev: _onPrev,
      onNext: _onNext,
    );
  }

  void _onNext() {
    ScopedModel.of<PresentationModel>(context).next();
  }

  void _onPrev() {
    ScopedModel.of<PresentationModel>(context).prev();
  }
}
//Text('Więc jak zacząć?'),
//Text('1. Flutter channel master'),
//Text('1. Flutter udpdate'),
//Text(
//'Download https://github.com/google/flutter-desktop-embedding'),
//Text(
//'2. export ENABLE_FLUTTER_DESKTOP=true https://github.com/google/flutter-desktop-embedding '),
//Text('3. Możemy sprawdzić czy śmiga poprzed flutter devices'),
//Text('3. Flutter run'),
//Text('XD'),

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

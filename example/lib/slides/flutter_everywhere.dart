import 'package:example_flutter/entrance_fader.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class FlutterEverywhereSlide extends StatefulWidget {
  @override
  _FlutterEverywhereSlideState createState() => _FlutterEverywhereSlideState();
}

class _FlutterEverywhereSlideState extends State<FlutterEverywhereSlide> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: FlutterLogo(size: 300),
          ),
          Align(
            alignment: Alignment(0, -0.8),
            child: EntranceFader(
              child: Image.asset(
                'assets/ios_logo.png',
                height: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.5, -0.5),
            child: EntranceFader(
              offset: Offset(-40, 40),
              delay: Duration(milliseconds: 200),
              child: Image.asset(
                'assets/android_logo.png',
                height: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0.5),
            child: EntranceFader(
              offset: Offset(-40, -40),
              delay: Duration(milliseconds: 400),
              child: Image.asset(
                'assets/windows_logo.png',
                height: 140,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: EntranceFader(
              delay: Duration(milliseconds: 600),
              offset: Offset(0, -40),
              child: Image.asset(
                'assets/mac_logo.png',
                height: 200,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 0.5),
            child: EntranceFader(
              delay: Duration(milliseconds: 800),
              offset: Offset(40, -40),
              child: Image.asset(
                'assets/linux_logo.png',
                height: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, -0.5),
            child: EntranceFader(
              delay: Duration(milliseconds: 1000),
              offset: Offset(40, 40),
              child: Image.asset(
                'assets/browser_logo.png',
                height: 150,
              ),
            ),
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

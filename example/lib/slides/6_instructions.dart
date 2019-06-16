import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/scoped_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';

class InstructionsSlide extends StatefulWidget {
  @override
  _InstructionsSlideState createState() => _InstructionsSlideState();
}

class _InstructionsSlideState extends State<InstructionsSlide> {
  int index = 0;
  final backgroundKey = GlobalKey<BackgroundWrapperState>();

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 40, height: 1.5);
    return SlideWrapper(
      child: BackgroundWrapper(
        key: backgroundKey,
        child: Positioned(
          left: 600,
          right: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              Text(
                'Jak zacząć?',
                style: TextStyle(fontSize: 80, color: Colors.blue.shade900),
              ),
              SizedBox(height: 60),
              if (index < 3)
                AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: index == 1 ? 1 : 0,
                  child: Image.asset(
                    'assets/chernobyl.jpg',
                    width: 900,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: index > 2 ? 1 : 0,
                child: Text('\$ flutter channel master', style: style),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: index > 3 ? 1 : 0,
                child: Text(
                  '\$ flutter upgrade',
                  style: style,
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: index > 4 ? 1 : 0,
                child: Text(
                  '\$ export ENABLE_FLUTTER_DESKTOP=true',
                  style: style,
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: index > 5 ? 1 : 0,
                child: Text(
                  '\$ git clone https://github.com/google/flutter-desktop-embedding',
                  style: style,
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: index > 6 ? 1 : 0,
                child: Text(
                  '\$ cd flutter-desktop-embedding/example',
                  style: style,
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: index > 7 ? 1 : 0,
                child: Text(
                  '\$ flutter run',
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
      onPrev: _onPrev,
      onNext: _onNext,
    );
  }

  void _onNext() {
    if (index == 0) {
      setState(() => index++);
    } else if (index == 1) {
      setState(() => index++);
//      backgroundKey.currentState.hide();
    } else if (index == 2) {
      setState(() => index++);
    } else if (index == 3) {
      setState(() => index++);
    } else if (index == 4) {
      setState(() => index++);
    } else if (index == 5) {
      setState(() => index++);
    } else if (index == 6) {
      setState(() => index++);
    } else if (index == 7) {
      setState(() => index++);
    } else {
      ScopedModel.of<PresentationModel>(context).next();
    }
  }

  void _onPrev() {
    if (index > 0) {
      setState(() => index = 0);
    } else {
      ScopedModel.of<PresentationModel>(context).prev();
    }
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

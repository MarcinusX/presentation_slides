import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class HummingbirdSlide extends StatefulWidget {
  @override
  _HummingbirdSlideState createState() => _HummingbirdSlideState();
}

class _HummingbirdSlideState extends State<HummingbirdSlide> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/hummingbird.png',
              width: 1200,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 40),
            Opacity(
              opacity: index > 0 ? 1 : 0,
              child: Text(
                'Flutter for web',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.blue.shade900,
                ),
              ),
            )
          ],
        ),
      ),
      onPrev: _onPrev,
      onNext: _onNext,
    );
  }

  void _onNext() {
    if (index == 0) {
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

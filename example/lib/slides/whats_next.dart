import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class WhatsNextSlide extends StatefulWidget {
  @override
  _WhatsNextSlideState createState() => _WhatsNextSlideState();
}

class _WhatsNextSlideState extends State<WhatsNextSlide> {
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
                index == 0 ? 'Co dalej?' : 'Pytania? 🙂',
                style: TextStyle(fontSize: 80, color: Colors.blue.shade900),
              ),
              SizedBox(height: 50),
              Text('🔥 https://MarcinusX.github.io/flutter_lodz', style: style),
              Text('👉 https://flutter.dev/desktop', style: style),
              Text('👉 https://flutter.dev/web', style: style),
              Text('👉 https://github.com/flutter/flutter_web', style: style),
              SizedBox(height: 50),
              Text('👌 https://marcinszalek.pl', style: style),
              Text('🐦️ @marcin_szalek', style: style),
              Text('✉️ marcin@fidev.io', style: style),
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

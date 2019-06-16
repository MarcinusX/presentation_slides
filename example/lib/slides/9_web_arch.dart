import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class WebArchitectureSlide extends StatefulWidget {
  @override
  _WebArchitectureSlideState createState() => _WebArchitectureSlideState();
}

class _WebArchitectureSlideState extends State<WebArchitectureSlide> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: Column(
        children: <Widget>[
          SizedBox(height: 60),
          Text(
            'Jak to działa?',
            style: TextStyle(fontSize: 80, color: Colors.blue.shade900),
          ),
          SizedBox(height: 140),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              AnimatedOpacity(
                opacity: index > 0 ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/flutter_architecture.png',
                      width: 800,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      'Mobile / Desktop',
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: index > 1 ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        'assets/flutter_web_arch.png',
                        width: 800,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      'Web',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
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
    if (index == 0) {
      setState(() => index++);
    } else if (index == 1) {
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

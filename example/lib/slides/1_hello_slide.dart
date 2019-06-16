import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/scoped_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';

class HelloSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style2 = TextStyle(fontSize: 35);

    return SlideWrapper(
      child: BackgroundWrapper(
        child: Positioned(
          left: 600,
          right: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 300),
              Text(
                'Flutter everywhere',
                style: TextStyle(fontSize: 80, color: Colors.blue.shade900),
              ),
              Text(
                'Czyli jak portować Flutterowe aplikacje\nna desktop i weba',
                style: TextStyle(fontSize: 50, color: Colors.blue.shade900),
              ),
              SizedBox(height: 150),
              Text('Marcin Szałek', style: style2),
              Text('Łódź Flutter Meetup #5', style: style2),
              Text('18 czerwca 2019', style: style2),
            ],
          ),
        ),
      ),
      onPrev: () => ScopedModel.of<PresentationModel>(context).prev(),
      onNext: () => ScopedModel.of<PresentationModel>(context).next(),
    );
  }
}

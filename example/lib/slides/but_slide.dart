import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class ButSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: Center(
        child: Image.asset(
          'assets/but.jpg',
          width: 800,
          fit: BoxFit.fitWidth,
        ),
      ),
      onPrev: () => ScopedModel.of<PresentationModel>(context).prev(),
      onNext: () => ScopedModel.of<PresentationModel>(context).next(),
    );
  }
}

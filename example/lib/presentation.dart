import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/scoped_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:example_flutter/slides/10_web_coding_time.dart';
import 'package:example_flutter/slides/1_hello_slide.dart';
import 'package:example_flutter/slides/2_about_me_slide.dart';
import 'package:example_flutter/slides/3_about_flutter_slide.dart';
import 'package:example_flutter/slides/4_how_it_works_slide.dart';
import 'package:example_flutter/slides/6_instructions.dart';
import 'package:example_flutter/slides/8_hello_desktop.dart';
import 'package:example_flutter/slides/9_1_hummingbird.dart';
import 'package:example_flutter/slides/9_web_arch.dart';
import 'package:example_flutter/slides/but_slide.dart';
import 'package:example_flutter/slides/flutter_everywhere.dart';
import 'package:example_flutter/slides/whats_next.dart';
import 'package:flutter/material.dart';

class Presentation extends StatefulWidget {
  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  @override
  Widget build(BuildContext context) {
    int index =
        ScopedModel.of<PresentationModel>(context, rebuildOnChange: true).index;
    return Scaffold(
      body: SizedBox.expand(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: getChild(index),
        ),
      ),
    );
  }

  Widget getChild(int index) {
    switch (index) {
      case 0:
        return HelloSlide();
      case 1:
        return AboutMeSlide();
      case 2:
        return AboutFlutterSlide();
      case 3:
        return HowItWorksSlide();
      case 4:
        return InstructionsSlide();
      case 5:
        return HelloDesktopSlide();
      case 6:
        return ButSlide();
      case 7:
        return HummingbirdSlide();
      case 8:
        return WebArchitectureSlide();
      case 9:
        return WebInstructionsSlide();
      case 10:
        return FlutterEverywhereSlide();
      case 11:
        return WhatsNextSlide();
      default:
        return SlideWrapper(child: Text('Placeholder, slide index: $index'));
    }
  }
}
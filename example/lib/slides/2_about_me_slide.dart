import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/scoped_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';

class AboutMeSlide extends StatefulWidget {
  @override
  _AboutMeSlideState createState() => _AboutMeSlideState();
}

class _AboutMeSlideState extends State<AboutMeSlide>
    with SingleTickerProviderStateMixin {
  int index = 0;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style1 =
        TextStyle(fontSize: 35, color: Colors.lightBlue.shade300, height: 1.5);
    TextStyle style2 = TextStyle(color: Colors.blue.shade900);

    return SlideWrapper(
      child: BackgroundWrapper(
        child: Positioned.fill(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 600,
                right: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 250),
                    Text(
                      'O mnie',
                      style:
                          TextStyle(fontSize: 80, color: Colors.blue.shade900),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: index > 0 ? 1 : 0,
                      child: Text(
                        '👉 Programuję we Flutterze od 2 lat',
                        style: style1,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: index > 1 ? 1 : 0,
                      child: RichText(
                        text: TextSpan(
                          style: style1.copyWith(fontSize: 36),
                          children: [
                            TextSpan(
                                text: '👉 Autor kilku pakietów na pub jak '),
                            TextSpan(text: 'numberpicker', style: style2),
                            TextSpan(text: ' czy '),
                            TextSpan(text: 'sliver_fab', style: style2),
                          ],
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: index > 2 ? 1 : 0,
                      child: Text(
                        '👉 Kontrybutor kodu do Fluttera',
                        style: style1,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: index > 3 ? 1 : 0,
                      child: RichText(
                        text: TextSpan(
                          style: style1.copyWith(fontSize: 36),
                          children: [
                            TextSpan(text: '👉 Autor artykułów na blogu '),
                            TextSpan(text: 'marcinszalek.pl', style: style2),
                            TextSpan(text: ' oraz na Medium dla '),
                            TextSpan(text: 'Flutter Community', style: style2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Opacity(
                          opacity: CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0, 0.2),
                          ).value,
                          child: Image.asset('assets/piano-demo.gif'),
                        ),
                        SizedBox(width: 20),
                        Opacity(
                          opacity: CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.2, 0.4),
                          ).value,
                          child: Image.asset('assets/ff_16.gif'),
                        ),
                        SizedBox(width: 20),
                        Opacity(
                          opacity: CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.4, 0.6),
                          ).value,
                          child: Image.asset('assets/implementation_2.gif'),
                        ),
                        SizedBox(width: 20),
                        Opacity(
                          opacity: CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.6, 0.8),
                          ).value,
                          child: Image.asset('assets/ripple_final.gif'),
                        ),
                        SizedBox(width: 20),
                        Opacity(
                          opacity: CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.8, 1.0),
                          ).value,
                          child: Image.asset('assets/tickets.gif'),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      onPrev: _onPrev,
      onNext: _onNext,
    );
  }

  void _onNext() {
    if (index < 4) {
      setState(() => ++index);
    } else if (index == 4) {
      setState(() => ++index);
      _animationController.forward();
    } else {
      ScopedModel.of<PresentationModel>(context).next();
    }
  }

  void _onPrev() {
    if (index == 5) {
      _animationController.value = 0;
      setState(() => --index);
    } else if (index > 0) {
      setState(() => --index);
    } else {
      ScopedModel.of<PresentationModel>(context).prev();
    }
  }
}

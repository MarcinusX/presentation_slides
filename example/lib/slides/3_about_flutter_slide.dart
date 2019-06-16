import 'dart:math' as math;

import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/scoped_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AboutFlutterSlide extends StatefulWidget {
  @override
  _AboutFlutterSlideState createState() => _AboutFlutterSlideState();
}

class _AboutFlutterSlideState extends State<AboutFlutterSlide>
    with TickerProviderStateMixin {
  int index = 0;

  AnimationController _animationController1;
  AnimationController _animationController2;
  AnimationController _animationController3;
  AnimationController _animationController4;
  AnimationController _animationController5;
  AnimationController _animationController6;

  @override
  void initState() {
    super.initState();
    _animationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController6 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController2.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationController4.dispose();
    _animationController5.dispose();
    _animationController6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: BackgroundWrapper(
        child: Positioned.fill(
          child: Stack(
            children: <Widget>[
              Center(
                child: FlutterLogo(size: 350),
              ),
              _transitioned(
                controller: _animationController1,
                child: Image.asset(
                  'assets/android_logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                alignment: Alignment(0.8, -0.8),
              ),
              _transitioned(
                controller: _animationController2,
                child: Image.asset(
                  'assets/ios_logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                alignment: Alignment(0.5, -0.8),
              ),
              _transitioned(
                controller: _animationController3,
                child: Image.asset(
                  'assets/fuchsia_logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                alignment: Alignment(0.8, 0),
              ),
              _transitioned(
                controller: _animationController4,
                child: Image.asset(
                  'assets/mac_logo.png',
                  height: 180,
                  width: 180,
                  fit: BoxFit.fill,
                ),
                alignment: Alignment(0.8, 0.8),
              ),
              _transitioned(
                controller: _animationController5,
                child: Image.asset(
                  'assets/windows_logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                alignment: Alignment(0.5, 0.8),
              ),
              _transitioned(
                controller: _animationController6,
                child: Image.asset(
                  'assets/linux_logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                alignment: Alignment(0.2, 0.8),
              ),
              Center(
                child: Transform.rotate(
                  angle: math.pi * 0.1,
                  child: Image.asset(
                    'assets/crm_example.png',
                    width: index > 5 ? 1200 : 0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: math.pi * -0.1,
                  child: Image.asset(
                    'assets/witcher_example.jpg',
                    width: index > 6 ? 1200 : 0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: math.pi * 0.05,
                  child: Image.asset(
                    'assets/saper_example.jpg',
                    width: index > 7 ? 1200 : 0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: math.pi * -0.03,
                  child: Image.asset(
                    'assets/slack_example.gif',
                    width: index > 8 ? null : 0,
                    fit: BoxFit.fitWidth,
                    scale: 0.2,
                  ),
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

  Widget _transitioned({
    AnimationController controller,
    Widget child,
    Alignment alignment,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        Animation curved = CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        );
        Animation<Alignment> align = AlignmentTween(
          begin: Alignment.center,
          end: alignment,
        ).animate(curved);
        return Align(
          alignment: align.value,
          child: Opacity(
            opacity: curved.value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  void _onNext() {
    if (index == 0) {
      _animationController1.forward();
      setState(() => ++index);
    } else if (index == 1) {
      _animationController3.forward();
      setState(() => ++index);
    } else if (index == 2) {
      _animationController4.forward();
      setState(() => ++index);
    } else if (index == 3) {
      _animationController5.forward();
      setState(() => ++index);
    } else if (index == 4) {
      _animationController6.forward();
      setState(() => ++index);
    } else if (index < 9) {
      setState(() => ++index);
    } else {
      ScopedModel.of<PresentationModel>(context).next();
    }
  }

  void _onPrev() {
    if (index > 0) {
      _animationController1.value = 0;
      _animationController2.value = 0;
      _animationController3.value = 0;
      _animationController4.value = 0;
      _animationController5.value = 0;
      _animationController6.value = 0;
      setState(() => index = 0);
    } else {
      ScopedModel.of<PresentationModel>(context).prev();
    }
  }
}

//
//Text(
//'Wiemy, że Flutter od początku był tworzony by wspierać iOSa i Androida.'),
//Text(
//'Wiemy, że ma on także wspierać Fuschię jeśli kiedykolwiek coś z niej wyjdzie.'),
//Text(
//'I tak sobie żyliśmy z tymi naszymi mobilnymi aplikacjami i było nam bardzo fajnie.'),
//Text('ALE'),
//Text(
//'Niewiele osób wie, że Flutter wspiera także aplikacje desktopowe'),
//Text('Co rozumiem, przez aplikacje desktopowe?'),
//Text(
//'Mam na myśli dowolne aplikacje w okienkach na Maca, Windowsa i Linuxa.'),
//
//Text('No dobrze ale co nam to daje?'),
//Text(
//'Żeby odpowiedzieć na to pytanie, spytam ilu z was w tej chwili wie jak napisać dowolną aplikację (nawet hello worlda) we Flutterze?'),
//Text(
//'A ilu z was wie jak napisać najprostszą aplikację na desktop? -> dowolną platformę'),
//Text(
//'Dokładnie! Pisanie na desktop nie jest czymś w czym większość z nas ma doświadczenie, przede wszystkim dlatego, że nie ma to aż tak dużego zapotrzebowania.'),
//Text(
//'Ale czy nie byłoby fajnie, gdyby podszedł do nas klient z potrzebą aplikacji desktopowej a my bylibyśmy w stanie to zrobić?'),
//Text('Imo tak.'),
//Text('----'),
//Text(
//'No dobra ale jaką ja niby aplikację mogę zrobić na desktop?'),
//Text('KAŻDĄ.'),
//Text('Może być to CRM'),
//Text(
//'Może być gra - niekoniecznie wiedźmin, ale sapera już się da'),
//Text(
//'Może być to czat! - Norbert Koszir wraz z Simonem Lightfootem napisali działającego klona Slacka! (screen)'),
//Text(
//'Może być to dowolny klient, którego robicie na aplikację mobilną!'),

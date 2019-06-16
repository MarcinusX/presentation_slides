import 'package:example_flutter/background_wrapper.dart';
import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/slide_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter/scoped_model.dart';

class HowItWorksSlide extends StatefulWidget {
  @override
  _HowItWorksSlideState createState() => _HowItWorksSlideState();
}

class _HowItWorksSlideState extends State<HowItWorksSlide>
    with SingleTickerProviderStateMixin {
  final backgroundKey = GlobalKey<BackgroundWrapperState>();
  AnimationController _animationController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideWrapper(
      child: BackgroundWrapper(
        key: backgroundKey,
        child: Positioned.fill(
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                curve: Curves.easeOutQuad,
                duration: Duration(seconds: 1),
                left: index == 0 ? 600 : 100,
                right: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 60),
                    Text(
                      'Jak to działa?',
                      style:
                          TextStyle(fontSize: 80, color: Colors.blue.shade900),
                    ),
                    SizedBox(height: 100),
                    _buildDiagram(),
                  ],
                ),
              ),
              _icons(),
              _yesGif(),
              _wiki(),
              _frame(),
            ],
          ),
        ),
      ),
      onPrev: _onPrev,
      onNext: _onNext,
    );
  }

  Widget _wiki() {
    double scale = 1.9;
    return Positioned(
      left: 100,
      bottom: 50,
      top: 50,
      child: AnimatedOpacity(
        opacity: index > 5 ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double alignment = (_animationController.value - 0.5) * 2;
            return Image.asset(
              'assets/github.png',
              width: 800,
              fit: BoxFit.none,
              alignment: Alignment(0, alignment),
              scale: scale,
            );
          },
        ),
      ),
    );
  }

  Widget _frame() {
    double top = 320;
    double height = 200;
    if (index == 9) {
      top = 510;
      height = 150;
    }
    if (index == 10) {
      top = 650;
      height = 50;
    } else if (index == 11) {
      top = 700;
    } else if (index == 12) {
      top = 890;
      height = 50;
    }
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      left: 100,
      width: 800,
      height: height,
      top: top,
      child: AnimatedOpacity(
        opacity: index > 7 ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 5),
          ),
        ),
      ),
    );
  }

  Widget _yesGif() {
    return Positioned(
      right: 340,
      bottom: 150,
      child: AnimatedOpacity(
        opacity: index > 4 ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          'assets/yes.gif',
          scale: 0.7,
        ),
      ),
    );
  }

  Widget _icons() {
    return Positioned(
      right: 150,
      top: 0,
      bottom: 0,
      child: AnimatedOpacity(
        opacity: index > 4 ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/ios_logo.png',
              height: 80,
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/android_logo.png',
              height: 80,
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/mac_logo.png',
              height: 80,
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/windows_logo.png',
              height: 80,
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/linux_logo.png',
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagram() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AnimatedOpacity(
              opacity: index > 0 ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              child: Text(
                'Flutter',
                style: TextStyle(fontSize: 40),
              ),
            ),
            AnimatedOpacity(
              opacity: index > 1 ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Text(
                'Platform',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: AnimatedOpacity(
                opacity: index > 0 ? 1 : 0,
                duration: Duration(milliseconds: 1000),
                child: Image.asset(
                  'assets/flutter_architecture.png',
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: index > 1 ? 1 : 0,
                        duration: Duration(milliseconds: 1000),
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            '→',
                            style: TextStyle(fontSize: 80),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: index == 3 ? 1 : 0,
                        duration: Duration(milliseconds: 1000),
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(
                            '→',
                            style: TextStyle(fontSize: 80),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: AnimatedOpacity(
                          opacity: index > 1 ? 1 : 0,
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            width: 300,
                            height: 100,
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Text(
                              'Canvas',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: AnimatedOpacity(
                          opacity: index == 3 ? 1 : 0,
                          duration: Duration(milliseconds: 1000),
                          child: Container(
                            width: 300,
                            height: 100,
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Text(
                              'Services',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  void _onNext() {
    if (index == 0) {
      backgroundKey.currentState.hide();
      setState(() => index++);
    } else if (index == 1) {
      setState(() => index++);
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
      _animationController.animateTo(0.05);
    } else if (index == 7) {
      setState(() => index++);
    } else if (index == 8) {
      setState(() => index++);
    } else if (index == 9) {
      setState(() => index++);
    } else if (index == 10) {
      setState(() => index++);
    } else if (index == 11) {
      setState(() => index++);
    } else {
      ScopedModel.of<PresentationModel>(context).next();
    }
  }

  void _onPrev() {
    if (index > 0) {
      backgroundKey.currentState.show();
      setState(() => index = 0);
    } else {
      ScopedModel.of<PresentationModel>(context).prev();
    }
  }
}
//
//Text('Dlaczego to wgl działa?'),
//Image.network(
//'https://www.altexsoft.com/media/2018/11/flutter.png'),
//Image.network(
//'https://cdn-images-1.medium.com/max/1600/0*NeeJq8PwkiTj8eMf.'),
//Text(
//'Otóż jak część z was może wiedzieć, Flutter znacząco różni się w działaniu od innych cross-platformowych frameworków.'),
//Text(
//'Główną różnicą jest to, że nie używa on natywnych komponentów tylko sam jest odpowiedzialny za renderowanie widoku, wykorzystuje on do tego bibliotekę Skia i jedyne czego potrzebuje to Canvas, na którym mógłby rysować.'),
//Text(
//'I tak jak wcześniej bez problemu mogliśmy z tego korzystać'),
//Text('Na androidzie'),
//Text('Na iOSie'),
//Text(
//'Więc w takim razie czemu by tu nie podstawić Maca, Windowsa albo Linuxa?'),
//Text(
//'Teraz tak, moglibyśmy spróbować zejść głębiej i zobaczyć dokładne implementacje jak to działa'),
//Text('ALE'),
//Text(
//'1. Jeśli zajrzymy do dokumentacji Flutterowej dla desktopa zobaczymy, tu ciekawe informacje'),
//Text(
//'Zobaczymy, że wersja na Maca jest w miare stabilna bo jest bardzo podobna do wersji na iOSa'),
//Text(
//'Ale zobaczymy także, wersje na Windowsa i Linuxa używają CLRF jako placeholdera i dolecolowo chcą używać czegoś innego'),
//Text(
//'2. Poza tym wydaje mi się że nas jako developerów mobilnych po prostu mało to interesuje i mało to nam powie. '),

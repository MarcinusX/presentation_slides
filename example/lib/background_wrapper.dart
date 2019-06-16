import 'package:flutter/material.dart';

class BackgroundWrapper extends StatefulWidget {
  final Widget child;

  const BackgroundWrapper({Key key, @required this.child}) : super(key: key);

  @override
  BackgroundWrapperState createState() => BackgroundWrapperState();
}

class BackgroundWrapperState extends State<BackgroundWrapper>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void hide() {
    _animationController.forward();
  }

  void show() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor color = Theme.of(context).primaryColor;
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: color.shade900,
                  ),
                ),
                Container(
                  width: 60 - 55 * _animationController.value,
                  height: double.infinity,
                  color: color.shade800,
                  child: Container(
                    color: color.shade800,
                  ),
                ),
                Container(
                  width: 50 - 45 * _animationController.value,
                  height: double.infinity,
                  color: color.shade700,
                ),
                Container(
                  width: 40 - 35 * _animationController.value,
                  height: double.infinity,
                  color: color.shade600,
                ),
                Container(
                  width: 30 - 25 * _animationController.value,
                  height: double.infinity,
                  color: color.shade500,
                ),
                Spacer(
                  flex: 4 + (_animationController.value * 100).round(),
                ),
              ],
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

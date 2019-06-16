import 'package:example_flutter/presentation_model.dart';
import 'package:example_flutter/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlideWrapper extends StatefulWidget {
  final VoidCallback onNext;

  final VoidCallback onPrev;

  final Widget child;

  const SlideWrapper({Key key, this.onNext, this.onPrev, @required this.child})
      : super(key: key);

  @override
  _SlideWrapperState createState() => _SlideWrapperState();
}

class _SlideWrapperState extends State<SlideWrapper> {
  final FocusNode _focusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _onKeyEvent,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _next,
        child: widget.child,
      ),
    );
  }

  void _onKeyEvent(RawKeyEvent event) {
    if (event.runtimeType == RawKeyDownEvent) {
      if (event.physicalKey == PhysicalKeyboardKey.arrowRight ||
          event.physicalKey == PhysicalKeyboardKey.pageDown) {
        _next();
      } else if (event.physicalKey == PhysicalKeyboardKey.arrowLeft ||
          event.physicalKey == PhysicalKeyboardKey.pageUp) {
        _prev();
      }
    }
  }

  void _next() {
    if (widget.onNext != null) {
      widget.onNext();
    } else {
      ScopedModel.of<PresentationModel>(context).next();
    }
  }

  void _prev() {
    if (widget.onPrev != null) {
      widget.onPrev();
    } else {
      ScopedModel.of<PresentationModel>(context).prev();
    }
  }
}

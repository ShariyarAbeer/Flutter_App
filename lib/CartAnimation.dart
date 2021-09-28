import 'dart:math';
import 'package:flutter/material.dart';

class CartAnimation extends StatefulWidget {
  final Offset startPosition;
  final Offset endPosition;
  final Color color;
  final double opacity;
  final double height;
  final double width;
  final double dxCurveAnimation;
  final double dyCurveAnimation;
  final String image;
  double initPos;
  double ratio = 1.0;

  CartAnimation({
    Key key,
    @required this.startPosition,
    @required this.endPosition,
    this.color = Colors.red,
    this.height = 14,
    this.width = 14,
    this.opacity = 1.0,
    this.dxCurveAnimation = 100,
    this.dyCurveAnimation = 250,
    this.image,
  }) : super(key: key);

  @override
  _CartAnimationPageState createState() => _CartAnimationPageState();
}

class _CartAnimationPageState extends State<CartAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller; // Animation controller
  Animation<double> _animation; // animation
  double left; // The left of the small dot (dynamic calculation)
  double top; // Small far point right (dynamic calculation)

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    var x0 = widget.startPosition.dx;
    var y0 = widget.startPosition.dy;

    var x1 = widget.startPosition.dx - widget.dxCurveAnimation;
    var y1 = widget.startPosition.dy - widget.dyCurveAnimation;

    var x2 = widget.endPosition.dx;
    var y2 = widget.endPosition.dy;

    _animation.addListener(() {
// Value for second-order Bezier curve
      var t = _animation.value;
      if (mounted)
        setState(() {
          left = pow(1 - t, 2) * x0 + 2 * t * (1 - t) * x1 + pow(t, 2) * x2;
          top = pow(1 - t, 2) * y0 + 2 * t * (1 - t) * y1 + pow(t, 2) * y2;
          widget.ratio = widget.initPos / top;
        });
    });

    // Initialize the position of the widget
    left = widget.startPosition.dx;
    widget.initPos = top = widget.startPosition.dy;

    // The animation starts when the widget is displayed
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("Start");
    // print(left);
    // print(top);
    // Use Stack -> Positioned to control the position of the Widget
    return Stack(
      children: <Widget>[
        Positioned(
            left: left,
            top: top,
            child: Opacity(
              opacity: widget.opacity,
              child: ClipOval(
                child: Container(
                  width: widget.height * widget.ratio,
                  height: widget.width * widget.ratio,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.fill),
                    color: widget.color,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

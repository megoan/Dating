import "package:flutter/material.dart";
import 'dart:math';

class Loader extends StatefulWidget {
  final double radius;
  final double dotRadius;

  Loader({this.radius = 30.0, this.dotRadius = 10.0});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  Animation<double> animationRotation;
  Animation<double> animation_0;
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;
  Animation<double> animation_4;
  Animation<double> animation_5;
  Animation<double> animation_6;
  Animation<double> animation_7;

  // Animation<double> animation_radius_in;
  // Animation<double> animation_radius_out;
  AnimationController controller;

  double radius;
  double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    controller = AnimationController(lowerBound: 0.0, upperBound: 1.0, duration: const Duration(milliseconds: 2000), vsync: this);

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    animation_0 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );
    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.40, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.50, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, 0.60, curve: Curves.linear),
      ),
    );
    animation_4 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.7, curve: Curves.linear),
      ),
    );

    animation_5 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.8, curve: Curves.linear),
      ),
    );

    animation_6 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 0.9, curve: Curves.linear),
      ),
    );
    animation_7 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.7, 1, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {
        //print(animation_1.value);
      });
    });
    // animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(
    //     parent: controller,
    //     curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
    //   ),
    // );

    // animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: controller,
    //     curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
    //   ),
    // );

    // controller.addListener(() {
    //   setState(() {
    //     if (controller.value >= 0.75 && controller.value <= 1.0)
    //       radius = widget.radius * animation_radius_in.value;
    //     else if (controller.value >= 0.0 && controller.value <= 0.25)
    //       radius = widget.radius * animation_radius_out.value;
    //   });
    // });

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {}
    // });

    controller.repeat();
  }

  double setRadiousAmount(Animation<double> animation) {
    return dotRadius * animation.value <= 0.4 ? 2.5 * animation.value : (animation.value > 0.40 && animation.value <= 0.6) ? 1.0 : 2.5 - (2.5 * animation.value);
  }

  double setOpacityAmmount(Animation<double> animation) {
    return animation.value <= 0.4 ? 2.5 * animation.value : (animation.value > 0.40 && animation.value <= 0.6) ? 1.0 : 2.5 - (2.5 * animation.value);
  }

  Color returnBetweenColor(BuildContext context, double amount) {
    int r;
    int g;
    int b;
    Color c1 = Colors.deepPurple;
    Color c2 = Colors.indigoAccent;

    r = ((c1.red - c2.red) * amount + c2.red).round();
    g = ((c1.green - c2.green) * amount + c2.green).round();
    b = ((c1.blue - c2.blue) * amount + c2.blue).round();

    return new Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    //print(animation_1.value <= 0.4 ? 2.5 * animation_1.value : (animation_1.value > 0.40 && animation_1.value <= 0.60) ? 1.0 : 2.5 - (2.5 * animation_1.value));
    // print(animation_0.value);
    return Container(
      width: 100.0,
      height: 100.0,
      //color: Colors.black12,
      child: new Center(
        child: new RotationTransition(
          turns: animationRotation,
          child: new Container(
            //color: Colors.limeAccent,
            child: new Center(
              child: Stack(
                children: <Widget>[
                  // new Transform.translate(
                  //   offset: Offset(0.0, 0.0),
                  //   child: Dot(
                  //     radius: radius,
                  //     color: Colors.black12,
                  //   ),
                  // ),
                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_0),
                      child: Dot(
                        radius: dotRadius, // setRadiousAmount(animation_0),
                        color: returnBetweenColor(context, 0.875),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0),
                      radius * sin(0.0),
                    ),
                  ),
                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_1),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0.750),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 1 * pi / 4),
                      radius * sin(0.0 + 1 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_2),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0.625),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 2 * pi / 4),
                      radius * sin(0.0 + 2 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_3),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0.5),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 3 * pi / 4),
                      radius * sin(0.0 + 3 * pi / 4),
                    ),
                  ),

                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_4),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0.375),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 4 * pi / 4),
                      radius * sin(0.0 + 4 * pi / 4),
                    ),
                  ),

                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_5),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0.250),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 5 * pi / 4),
                      radius * sin(0.0 + 5 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_6),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0.125),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 6 * pi / 4),
                      radius * sin(0.0 + 6 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Opacity(
                      opacity: setOpacityAmmount(animation_7),
                      child: Dot(
                        radius: dotRadius,
                        color: returnBetweenColor(context, 0),
                      ),
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 7 * pi / 4),
                      radius * sin(0.0 + 7 * pi / 4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

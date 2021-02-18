import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/core/constants/palette.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final double width;
  final double radius;

  final Function onTap;

  Button({
    @required this.child,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.radius = 0,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? EdgeInsets.zero,
      width: width,
      height: height,
      child: FlatButton(
        disabledTextColor: Palette.white,
        disabledColor: Palette.gray100,
        onPressed: onTap,
        color: backgroundColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}

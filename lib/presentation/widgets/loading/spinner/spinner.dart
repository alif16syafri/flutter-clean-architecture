import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  final double size;
  final Color color;
  
  Spinner({
    this.size = 24.0,
    this.color,
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/core/constants/palette.dart';
import 'package:transparent_image/transparent_image.dart';

class FadedImage extends StatelessWidget {
  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit boxFit;
  final Alignment alignment;
  final Color backgroundColor;
  
  final double width;
  
  FadedImage({
    @required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    this.boxFit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.width,
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? Palette.gray100,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageUrl,
          fit: boxFit,
          alignment: alignment,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/article/article.dart';
import 'package:flutter_clean_architecture/presentation/core/constants/palette.dart';
import 'package:flutter_clean_architecture/presentation/widgets/image/faded_image.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  final EdgeInsets margin;

  ArticleCard({
    @required this.article,
    this.margin,
  });

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText2.copyWith(height: 1.4),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            article.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Palette.gray100,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.0),
      width: MediaQuery.of(context).size.width * 0.2,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: FadedImage(imageUrl: article.urlToImage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildInfo(context)),
          _buildImage(context),
        ],
      ),
    );
  }
}

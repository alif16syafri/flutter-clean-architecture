import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/core/constants/palette.dart';
import 'package:flutter_clean_architecture/presentation/features/article/articles/bloc/articles_bloc.dart';
import 'package:flutter_clean_architecture/presentation/features/article/articles/widgets/article_card.dart';
import 'package:flutter_clean_architecture/presentation/widgets/loading/index.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  ArticlesBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<ArticlesBloc>();
    _bloc.add(FetchArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        title: Text(
          'n w s',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (_, ArticlesState state) {
          if (state is Loading) {
            return Center(child: Spinner());
          }

          if (state is Loaded) {
            return ListView(
              padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              children: List.generate(state.articles.length, (index) {
                return ArticleCard(
                  article: state.articles[index],
                  margin: EdgeInsets.only(bottom: 24.0),
                );
              }),
            );
          }

          if (state is Error) {
            return Text('Error');
          }

          return Container();
        },
      ),
    );
  }
}

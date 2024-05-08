import 'package:flutter/material.dart';
import 'package:l8proj/News/class_news.dart';
import 'package:l8proj/News/fetch_news.dart';
import 'package:http/http.dart' as http;

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости КубГАУ'),
      ),
      body: FutureBuilder<List<News>>(
        future: fetchNews(http.Client()),
        builder: (context, news) {
          if (news.hasError) {
            return const Center(
              child: Text('Ошибка запроса!'),
            );
          } else if (news.hasData) {
            return NewsList(newsl: news.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}




class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.newsl});

  final List<News> newsl;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsl.length,
      itemBuilder: (context, index) {
        return
          Card(
            child:
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/newspage', arguments: newsl[index].DETAIL_PAGE_URL);
              },
              child:
                Column(children: [
                  Image.network(newsl[index].PREVIEW_PICTURE_SRC),
                  Text(newsl[index].ACTIVE_FROM),
                  Text(newsl[index].TITLE),
                  const Divider(),
                  Text(newsl[index].PREVIEW_TEXT)]
              )
            )
        );
      },
    );
  }
}

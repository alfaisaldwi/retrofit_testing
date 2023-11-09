import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrof/feature/home/presentation/widget/content_tile.dart';
import 'package:retrof/feature/home/presentation/widget/floating_button.dart';
import 'package:retrof/model/post_model.dart';
import 'package:retrof/service/post_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Retrofit)',
      )),
      floatingActionButton: floatingButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black38,
              child: const Text('Testing Retrofit'),
            ),
            _body()
          ],
        ),
      ),
    );
  }

  FutureBuilder _body() {
    final apiservice =
        PostService(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder(
        future: apiservice.getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final List<PostModel> posts  = snapshot.data;
              return contentTile(posts);
            } else {
              return Container(
                child: Text(
                  "text",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

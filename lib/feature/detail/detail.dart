import 'package:flutter/material.dart';
import 'package:retrof/model/post_model.dart';
import 'package:retrof/service/post_service.dart';
import 'package:dio/dio.dart';

class Details extends StatelessWidget {
  final id;
  const Details({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Post"),
        actions: const [],
      ),
      body: FutureBuilder(
        future: _getPostDetails(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else {
            dynamic detailPost = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${detailPost?.title ?? 'Waiting.. '}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    Divider(),
                    Text(
                      '${detailPost?.body ?? 'Waiting.. '}',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> _getPostDetails() async {
    final apiservice =
        PostService(Dio(BaseOptions(contentType: "application/json")));
    return await apiservice.getPostFromId(id);
  }
}

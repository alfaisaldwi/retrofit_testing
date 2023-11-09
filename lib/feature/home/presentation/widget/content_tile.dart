import 'package:flutter/material.dart';
import 'package:retrof/feature/detail/detail.dart';
import 'package:retrof/model/post_model.dart';

Widget contentTile(
  List<PostModel> posts,
) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      id: posts[index].id,
                    ),
                  )),
              child: ListTile(
                title: Text(
                  posts[index].title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  posts[index].body,
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                trailing: const Icon(Icons.arrow_right_rounded),
              ),
            )
          ]),
        );
      });
}

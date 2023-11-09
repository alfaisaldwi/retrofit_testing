import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrof/model/post_model.dart';
import 'package:retrof/service/post_service.dart';

class FormView extends StatefulWidget {
  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final apiservice =
      PostService(Dio(BaseOptions(contentType: "application/json")));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Post Data'),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _bodyController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final post = PostModel(
                      // Ganti dengan id yang sesuai
                      userId: 2,
                      title: _titleController.text,
                      body: _bodyController.text,
                    );
                    apiservice.postPost(post).then((value) {
                   
                      print('Berhasil memposting data');
                      // Tambahkan tindakan lain yang diinginkan di sini
                    }).catchError((error) {
                      // Tangani kesalahan di sini
                      print('Terjadi kesalahan: $error');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

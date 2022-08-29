import 'package:flutter/material.dart';

import '../../model/photo/photo.dart';
import '../../network/remote/apis.dart';

class PostPhotoApis extends StatelessWidget {
  final ApiClient client;
  final Photo photo;

  const PostPhotoApis({Key? key, required this.client, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.postPhoto(photo),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print('Thang: ${snapshot.data}');
          return Align(
            alignment: Alignment.bottomCenter,
            child: Text('Success: ${snapshot.data?.title}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'package:demo_call_apis/on_action_callback.dart';
import 'package:demo_call_apis/ui/home_page/components/item_photo.dart';
import 'package:flutter/material.dart';

import '../../../model/photo/photo.dart';
import '../../../network/remote/apis.dart';

class ListPhotosApis extends StatelessWidget {
  final ApiClient client;
  final OnActionCallback callback;

  const ListPhotosApis({Key? key, required this.client, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Photo>? photos = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: photos?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = photos![index];
              return InkWell(
                child: ItemPhoto(photo: item),
                onTap: () {
                  callback(item);
                },
              );
            },
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

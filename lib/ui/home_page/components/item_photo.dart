import 'package:flutter/material.dart';

import '../../../model/photo/photo.dart';

class ItemPhoto extends StatelessWidget {
  final Photo photo;

  const ItemPhoto({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 7.5,
        child: Card(
          elevation: 10,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(photo.url),
                ),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AlbumID: ${photo.albumId}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'ID: ${photo.id}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Text(
                        'Title: ${photo.title}',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

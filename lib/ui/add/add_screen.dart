import 'dart:io';

import 'package:demo_call_apis/model/photo/photo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../network/remote/apis.dart';

class AddScreen extends StatefulWidget {
  final bool isAdd;

  const AddScreen({Key? key, required this.isAdd}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController albumIdController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  bool isCallApis = false;

  void _setImageFileListFromFile(XFile? value) {
    _imageFile = value == null ? null : value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.isAdd ? 'Thêm' : 'Chỉnh sửa'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
                child: TextField(
                  controller: albumIdController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _getImageFromGallery();
              },
              child: Container(
                height: 200,
                width: 200,
                color: Colors.white,
                child: _imageFile == null
                    ? Align(
                        alignment: Alignment.center,
                        child: Text('No data'),
                      )
                    : Image.file(
                        File(_imageFile!.path),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 15,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF42A5F5),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  onPressed: () {
                    var mPhoto = Photo(
                        albumId: int.parse(albumIdController.text.toString()),
                        id: int.parse(idController.text.toString()),
                        title: titleController.text.toString(),
                        url: _imageFile!.path,
                        thumbnailUrl: _imageFile!.path);
                    setState(() {
                      isCallApis = true;
                    });
                    var client = ApiClient(
                      Dio(
                        BaseOptions(
                            contentType: 'application/json; charset=UTF-8'),
                      ),
                    );
                    _callApisPostPhoto(mPhoto, client);
                  },
                  child: Text(
                    "Lưu",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            _getProperWidget(),
          ],
        ),
      ),
    );
  }

  void _getImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 100,
      source: ImageSource.gallery,
    );
    setState(() {
      _setImageFileListFromFile(pickedFile);
    });
  }

  Widget _getProperWidget() {
    if (isCallApis)
      return new CircularProgressIndicator();
    else
      return new Text('Success');
  }

  void _callApisPostPhoto(Photo mPhoto, ApiClient client) {
    client.postPhoto(mPhoto).then(
        (value) => (value) {
              setState(() {
                isCallApis = false;
                print('Thang: $value');
              });
            }, onError: (error) {
      setState(() {
        isCallApis = false;
        print('Thang: $error');
      });
    });
  }
}

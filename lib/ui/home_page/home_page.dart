import 'package:demo_call_apis/network/remote/apis.dart';
import 'package:demo_call_apis/ui/add/add_screen.dart';
import 'package:demo_call_apis/ui/home_page/components/list_photo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ApiClient client;

  @override
  void initState() {
    client = ApiClient(
      Dio(
        BaseOptions(contentType: 'application/json'),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Card(
                    color: Colors.blueGrey,
                    child: SizedBox(
                      width: 60,
                      height: 70,
                      child: IconButton(
                        onPressed: () {
                          _goToScreenAdd();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Thêm mới sinh viên',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: ListPhotosApis(
                client: client,
                callback: (val) {
                  print('Thang: $val');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToScreenAdd() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddScreen(isAdd: true),
      ),
    );
  }
}

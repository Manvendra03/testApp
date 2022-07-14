import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newtestapp/chat_listtile.dart';
import 'package:http/http.dart' as http;
import 'package:newtestapp/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<UserModel> items = [];
  Future<void> fetchData() async {
    items.clear();
    String uriString = 'https://demo1779595.mockable.io/companies';
    var response = await http.post(Uri.parse(uriString));

    if (response.statusCode == 200) {
      // print(response.body);
      List data = jsonDecode(response.body)["companiesList"];

      data.forEach((element) {
        UserModel temp = UserModel.fromJson(element);
        items.add(temp);
      });

      print(items[1].userName);
      // return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed');
    }
    // UserModel userModel = new UserModel(profileImage:  , userName: userName, Isverified: Isverified, Isonline: Isonline)
  }

  TextStyle textStyle1 =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("TestApp"),
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: fetchData,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Chats',
                        style: textStyle1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: fetchData(),
                      builder: (context, snap) {
                        return snap.connectionState == ConnectionState.waiting
                            ? Expanded(
                                child: Center(
                                child: CircularProgressIndicator(),
                              ))
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder: (context, index) {
                                    return ChatListTile(
                                      Isactive: items[index].Isactive,
                                      Isverified: items[index].Isverified,
                                      companyName: items[index].companyName,
                                      imageUrl: items[index].profileImage,
                                      userName: items[index].userName,
                                    );
                                  },
                                ),
                              );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

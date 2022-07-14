import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  final String userName;
  final String companyName;
  final String imageUrl;
  final String Isactive;
  final bool Isverified;

  const ChatListTile(
      {super.key,
      required this.userName,
      required this.companyName,
      required this.imageUrl,
      required this.Isactive,
      required this.Isverified});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(imageUrl),
            radius: 28,
          ),
          title: Row(
            children: [
              Text(userName,
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 59, 104),
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                width: 5,
              ),
              Isverified
                  ? Container(
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    )
                  : Container()
            ],
          ),
          subtitle: Text(
            companyName,
            style: TextStyle(fontSize: 15),
          ),
          trailing: CircleAvatar(
            backgroundColor: Isactive == 'active' ? Colors.green : Colors.red,
            radius: 5,
          ),
        ),
        Divider(),
      ],
    );
  }
}

import 'package:GoogleMaps/chat2/widgets/chat_box.dart';
import 'package:GoogleMaps/chat2/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 229, 238, 1),
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: ChatBox(),
          )
        ],
      ),
    );
  }
}

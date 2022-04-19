import 'package:GoogleMaps/Report/Atak.dart';
import 'package:GoogleMaps/Report/Chachoengsao.dart';
import 'package:GoogleMaps/Report/Chai%20Nat.dart';
import 'package:GoogleMaps/Report/Chonburi.dart';
import 'package:GoogleMaps/Report/KhonKaen.dart';
import 'package:GoogleMaps/Report/Krabe.dart';
import 'package:GoogleMaps/Report/krungtep.dart';
import 'package:GoogleMaps/Report/kumpheng.dart';
import 'package:GoogleMaps/check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Report/Chanthaburi.dart';
import 'Report/Kalasin.dart';
import 'Report/Kanchanaburi.dart';

class blog extends StatefulWidget {
  const blog({Key key}) : super(key: key);

  @override
  _blogState createState() => _blogState();
}

class _blogState extends State<blog> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "โควิดหายได้ในกี่วัน", "age": "1/1/2565"},
    {"id": 2, "name": "เป็นโควิดกินยาเองได้มั้ย", "age": "1/1/2565"},
    {"id": 3, "name": "โควิดหายได้เองมั้ย", "age": "1/1/2565"},
    {"id": 4, "name": "ยาแผนไทยรักษาโควิด", "age": "1/1/2565"},
    {"id": 5, "name": "วัคซีนโควิด", "age": "1/1/2565"},
    {"id": 6, "name": "ติดโควิดต้องทำอย่างไร", "age": "1/1/2565"},
    {"id": 7, "name": "จันทบุรี", "age": "1/1/2565"},
    {"id": 8, "name": "ฉะเชิงเทรา", "age": "1/1/2565"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายชื่อจังหวัด'),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.teal[200],
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              switch (_foundUsers[index]["id"].toString()) {
                                case "1":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check10();
                                  }));
                                  break;
                                case "2":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check11();
                                  }));
                                  break;
                                case "3":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check8();
                                  }));
                                  break;
                                case "4":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check7();
                                  }));
                                  break;
                                case "5":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check12();
                                  }));
                                  break;
                                case "6":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check9();
                                  }));
                                  break;
                                case "7":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check14();
                                  }));
                                  break;
                                case "8":
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Check3();
                                  }));
                                  break;
                                default:
                              }
                            });
                          },
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black87),
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle: Text(
                              'วันที่ลง:${_foundUsers[index]["age"].toString()} '),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:GoogleMaps/model/profile.dart';
import 'package:GoogleMaps/screen/pic.dart';
import 'package:flutter/material.dart';
import '../widget/Ep241Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//==================================================================
// MAIN CLASS
//==================================================================
class Ep241Page extends StatefulWidget {
  @override
  _Ep241PageState createState() => _Ep241PageState();
}

//==================================================================
// STATE CLASS
//==================================================================
class _Ep241PageState extends State<Ep241Page> {
//==================================================================
// DECLARE VARIABLE
//==================================================================
//======================================================
// STEP#1: SNACKBAR
//======================================================
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController()..text;
  // final TextEditingController passwordController =  TextEditingController();
  final TextEditingController mobileNoController = TextEditingController()
    ..text;
  final TextEditingController addressController = TextEditingController()..text;
  final TextEditingController emailController = TextEditingController()..text;
  final TextEditingController lineIdController = TextEditingController()..text;
  final RegExp emailRegExpression =
      RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}');
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("profile")
        .doc(auth.currentUser.email)
        .get()
        .then((value) {
      emailController.text = value.data()["email"];
      nameController.text = value.data()["name"];
      mobileNoController.text = value.data()["mobileNo"];
      lineIdController.text = value.data()["lineID"];
      addressController.text = value.data()["address"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//======================================================
// STEP#2: SNACKBAR : DEFINE KEY
//======================================================
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.teal[800],
      ),
      body: ListView(
        children: <Widget>[
//==================================================================
// TEXTFORM FIELD: E-MAIL
//==================================================================

//==================================================================
// TEXTFORM FIELD: NAME
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: nameController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Name-Sermane',
              hintText: 'Enter Name-Sermane',
              icon: Icon(Icons.person),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Name';}
              return null;
            },
          ),
          TextFormFieldWidget(
            obscureText: false,
            textController: emailController,
            autovalidate: true,
            textInputType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'age',
              hintText: 'Enter age',
              icon: Icon(Icons.yard),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter Mobile No';
              }
              return null;
            },
          ),
//==================================================================
// TEXTFORM FIELD: ADDRESS
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: addressController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Address',
              hintText: 'Enter Address',
              icon: Icon(Icons.home),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Address';}
              return null;
            },
          ),
//==================================================================
// TEXTFORM FIELD: MOBILE
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: mobileNoController,
            autovalidate: true,
            textInputType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Mobile No',
              hintText: 'Enter Mobile No',
              icon: Icon(Icons.phone),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter Mobile No';
              }
              return null;
            },
          ),
//==================================================================
// TEXTFORM FIELD: LINE
//==================================================================
          TextFormFieldWidget(
            obscureText: false,
            textController: lineIdController,
            autovalidate: true,
            textInputType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'beallergic',
              hintText: 'beallergic',
              icon: Icon(Icons.line_style),
            ),
            validator: (String value) {
              // if (value.isEmpty) {return 'Enter Line ID';}
              return null;
            },
          ),
//==================================================================
// SAVE BUTTON
//==================================================================
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 360.0,
                height: 50.0,
                color: Colors.blue.shade100,
                child: RaisedButton(
                    onPressed: () async {
                      fnSaveProfile(
                          email: emailController.text,
                          name: nameController.text,
                          address: addressController.text,
                          mobileNo: mobileNoController.text,
                          lineId: lineIdController.text);
                    },
                    child: Text('Save',
                        style: TextStyle(color: Colors.black, fontSize: 15))),
              ),
              IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageUploads();
                  }));
                },
              ),
            ],
          ),

//==================================================================
// END LISVIEW
//==================================================================
        ],
      ),
    );
  }

//======================================================
// SAVE PROFILE FUNCTION
//======================================================
  fnSaveProfile(
      {String email,
      String name,
      String address,
      String mobileNo,
      String lineId}) async {
    await firestore.collection("profile").doc(auth.currentUser.email).set({
      'email': email,
      'name': name,
      'address': address,
      'mobileNo': mobileNo,
      'lineID': lineId,
    }).then((value) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Register $email profile completed. ')));
    }).catchError((error) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Register $email profile error $error ')));
    });

//======================================================
// SAVE TO DB "FIREBASE STORE"
//======================================================

//
//======================================================
// STEP#4: SNACKBAR : SHOW SNACKBAR
//======================================================
  }
}

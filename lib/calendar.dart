import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'event.dart';
import 'model/profile.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  String location = 'Null, Press Button';
  String Address;
  DateTime now = DateTime.now();
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void _create() async {
    try {
      await firestore
          .collection(auth.currentUser.email)
          .doc(profile.place)
          .set({'Place': Address, 'Time(Date)': DateTime.now().toString()});
    } catch (e) {
      print(e);
    }
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        // await placemarkFromCoordinates(position.latitude, position.longitude);
        await placemarkFromCoordinates(7.894322, 98.352791);
    print(placemarks);
    print(now);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality} ${place.subAdministrativeArea},${place.administrativeArea},${place.country}, ${place.postalCode}';
    setState(() {});
  }

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    super.dispose();
    _eventController.dispose();
  }

  @override
  void data() {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(auth.currentUser.email)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data.docs.map<Widget>((document) {
            return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(document["Place"].toString()),
                  subtitle: Text(document["Time(Date)"].toString()),
                ));
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บันทึกโลเคชั่น",
            style: textStyle(18, FontWeight.w600, Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _getGeoLocationPosition();
          location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
          GetAddressFromLatLong(position);
          _create();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                  'Your location has been send !\n ${Address},\nDay:${now.day.toString()}\nTime${now.hour.toString()}:${now.minute.toString()}'),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text("Ok"),
                  onPressed: () async {
                    data();
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay].add(Event(title: Address));
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(
                          title: Address,
                        )
                      ];
                    }

                    Navigator.pop(context);
                    _eventController.clear();
                    setState(() {});
                    return;
                  },
                ),
              ],
            ),
          );
        },
        label: Text("Add Event"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.teal[800],
      ),
    );
  }

  textStyle(int i, FontWeight w600, Color white) {}
}

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parking_app/providers/place.dart';
import 'package:parking_app/providers/places.dart';
import 'package:parking_app/providers/reservation.dart';
import 'package:parking_app/providers/reservations.dart';
import 'package:parking_app/providers/users.dart';
import 'package:parking_app/providers/vehicle.dart';
import 'package:provider/provider.dart';

import '../widgets/question_modal_bottom_sheet.dart';
import '../widgets/parking_details.dart';
import '../widgets/drawer_user_app.dart';
import '../widgets/choice_chip.dart';

class UserOverviewScreen extends StatefulWidget {
  static const routeName = '/user';

  @override
  _UserOverviewScreenState createState() => _UserOverviewScreenState();
}

class _UserOverviewScreenState extends State<UserOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  Places place;

  final _scaffoldKey = GlobalKey<FormState>();
  VoidCallback _showPersBottomSheetCallBack;
  int _value = 0;

  List<String> hoursBegin = [
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30'
  ];
  List<String> hoursEnd = [
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30'
  ];

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  var _newReservation = Reservation(
    id: null,
    city: ' ',
    fromDate: null,
    toDate: null,
    car: '',
    userId: null,
  );

  Future<void> _addReservation() async {
//    if (_isLoading) {
//      return;
//    }
//    final isValid = _scaffoldKey.currentState.validate();
//    if (!isValid) {
//      return;
//    }
//    _scaffoldKey.currentState.save();
//    setState(() {
//      _isLoading = true;
//    });

    Users users = Provider.of<Users>(context, listen: false);
    await users.addReservation(users.currentUser.id, _newReservation);
    print(users.toString() + '<=------------------');
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  void _showBottomSheet() {
    Provider.of<Places>(context).fetchAndSetPlaces();
    Provider.of<Reservations>(context).initializeReservation();
    Reservation res = Provider.of<Reservations>(context).currentReservation;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: _height * 0.0008,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    color: Colors.white,
                    width: _width,
                    child: Text(
                      'Parking details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _height * 0.022,
                        letterSpacing: 0.92,
                      ),
                    ),
                  ),
                  QuestionModalBootomSheet(_width, _height, 'Where?'),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    color: Colors.white,
                    height: 60,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, i) {
                        return ChipWidget(
                            Provider.of<Places>(context)
                                .places
                                .map((p) => p.city)
                                .toList(), (selected) {
                          setState(() {
                            Provider.of<Reservations>(context)
                                .setCity(selected);
                            print("Selected city $selected");
                          });
                        }, () {
                          return Provider.of<Reservations>(context)
                              .currentReservation
                              .city;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  QuestionModalBootomSheet(_width, _height, 'When?'),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    height: 90,
                    color: Colors.white,
                    child: DatePickerTimeline(
                      DateTime.now(),
                      selectionColor: Colors.orange,
                      onDateChange: (date) {
                        setState(() {
                          Provider.of<Reservations>(context).setFromDate(date
                              .add(Duration(hours: res.fromDate.hour))
                              .add(Duration(minutes: res.fromDate.minute)));
                          Provider.of<Reservations>(context).setToDate(date
                              .add(Duration(hours: res.toDate.hour))
                              .add(Duration(minutes: res.toDate.minute)));
                        });
                        print(date.day.toString());
                      },
                    ),
                  ),
                  QuestionModalBootomSheet(_width, _height, 'From what time?'),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    color: Colors.white,
                    height: 60,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, i) {
                        return ChipWidget(hoursBegin, (selected) {
                          setState(() {
                            List<String> parts = selected.toString().split(":");
                            var fromDate = Provider.of<Reservations>(context)
                                .currentReservation
                                .fromDate;
                            var fromDay = new DateTime(
                                fromDate.year, fromDate.month, fromDate.day);
                            Provider.of<Reservations>(context).setFromDate(
                                fromDay
                                    .add(Duration(hours: int.parse(parts[0])))
                                    .add(Duration(
                                        minutes: int.parse(parts[1]))));
                            print(
                                "Set from ${Provider.of<Reservations>(context).currentReservation.fromDate}");
                          });
                        }, () {
                          return DateFormat.Hm().format(
                              Provider.of<Reservations>(context)
                                  .currentReservation
                                  .fromDate);
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  QuestionModalBootomSheet(_width, _height, 'To what time?'),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    color: Colors.white,
                    height: 60,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, i) {
                        return ChipWidget(hoursEnd, (selected) {
                          setState(() {
                            List<String> parts = selected.toString().split(":");
                            var toDate = Provider.of<Reservations>(context)
                                .currentReservation
                                .toDate;
                            var toDay = new DateTime(
                                toDate.year, toDate.month, toDate.day);
                            Provider.of<Reservations>(context).setToDate(toDay
                                .add(Duration(hours: int.parse(parts[0])))
                                .add(Duration(minutes: int.parse(parts[1]))));
                            print(
                                "Set to ${Provider.of<Reservations>(context).currentReservation.toDate}");
                          });
                        }, () {
                          return DateFormat.Hm().format(
                              Provider.of<Reservations>(context)
                                  .currentReservation
                                  .toDate);
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  QuestionModalBootomSheet(_width, _height, 'Which car?'),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    color: Colors.white,
                    height: 60,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, i) {
                        return ChipWidget(
                            Provider.of<Users>(context)
                                .currentUser
                                .vehicles
                                .map((v) => v.getName())
                                .toList(), (selected) {
                          setState(() {
                            Provider.of<Reservations>(context).setCar(selected);
                            print("Selected car $selected");
                          });
                        }, () {
                          var car = Provider.of<Reservations>(context)
                              .currentReservation
                              .car;
                          print("Returning $car");
                          return car;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Container(
                    //alignment: AlignmentDirectional.bottomCenter,
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 50),
                    color: Colors.white,
                    width: _width,
                    child: ButtonTheme(
                      height: _height * 0.07,
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Text(
                          'Book now',
                          style: TextStyle(
                            fontSize: _height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.92,
                          ),
                        ),
                        onPressed: () {
                          print('Book now');
                          _addReservation();
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Image.asset(
            'assets/logo.png',
            height: 70,
            width: 70,
            alignment: FractionalOffset.center,
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      endDrawer: UserAppDrawer(),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                alignment: FractionalOffset.topLeft,
                child: Text(
                  'Parking details:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 0.92,
                  ),
                ),
              ),
              Container(
                height: _height * 0.4,
                width: _width,
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: ParkingDetails(
                      'Kraków', 'Długa 21', 20, 'Honda', 'Accord', 'KR12345'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text(
                                'Delete Alert',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.92,
                                ),
                              ),
                              content: Text(
                                'Are you sure you want to delete this reservation?',
                                style: TextStyle(
                                  letterSpacing: 0.92,
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      letterSpacing: 0.92,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(ctx).pop(false);
                                  },
                                ),
                                Container(
                                  height: 30,
                                  child: VerticalDivider(),
                                ),
                                FlatButton(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      letterSpacing: 0.92,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(ctx).pop(true);
                                  },
                                ),
                              ],
                            ));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: _height * 0.1,
                  bottom: _height * 0.1,
                ),
                width: _width * 0.9,
                child: ButtonTheme(
                  height: _height * 0.08,
                  child: RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Check Availability',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _height * 0.025,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.92,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onPressed: _showPersBottomSheetCallBack,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

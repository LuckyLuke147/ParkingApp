import 'package:flutter/material.dart';
import 'package:parking_app/providers/place.dart';
import 'package:parking_app/providers/places.dart';
import 'package:provider/provider.dart';

import './place_cart.dart';

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  var _isInit = true;
  TextEditingController placeController = TextEditingController();

  List<String> spinnerItems = ['Kraków', 'Warszawa', 'Gdańsk'];
  final List<String> litems =
      new List<String>.generate(30, (i) => 'Items ${i + 1}');
  String dropdownValue = 'Kraków';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              color: Color.fromRGBO(255, 255, 255, 0),
              child: GestureDetector(
                onTap: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Input new place number:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.92,
                          ),
                        ),
                        content: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 0.92,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.orange,
                                      ),
                                    ),
                                    hintText: 'value',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                      letterSpacing: 0.92,
                                    ),
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            elevation: 5.0,
                            onPressed: () {
                              Navigator.of(context).pop();
                              litems.add(placeController.text);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.orange, width: 1.0),
                              ),
                              child: GestureDetector(
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                    letterSpacing: 0.92,
                                  ),
                                ),
                                onTap: () {
                                  print('Add new place');
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  '+ Add',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.92,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromRGBO(127, 127, 127, 1),
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  letterSpacing: 0.92,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.orange,
                ),
                onChanged: (String data) {
                  setState(() {
                    dropdownValue = data;
                  });
                },
                items:
                    spinnerItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Color.fromRGBO(127, 127, 127, 1),
                        letterSpacing: 0.92,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            dropdownValue + ' : ' + litems.length.toString() + ' places',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 0.92,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            primary: false,
            itemCount: litems.length,
            itemBuilder: (ctx, i) => PlaceCart(litems[i], i + 1),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/vehicle_cart.dart';
import '../widgets/new_vehicle_dialog.dart';

class VehiclesScreen extends StatelessWidget {
  static const routeName = '/vehicles';

  TextEditingController brandController = TextEditingController();

  final List<String> items =
      new List<String>.generate(5, (i) => 'Items ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Vehicles',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 0.92,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'New vehicle',
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
                            NewVehicle('Car brand'),
                            SizedBox(height: 20),
                            NewVehicle('Car model'),
                            SizedBox(height: 20),
                            NewVehicle('Registration No.'),
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
                          items.add(brandController.text);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.orange, width: 1.0),
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
                              print('Add new vehicle');
                            },
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        primary: false,
        itemCount: items.length,
        itemBuilder: (ctx, i) =>
            VehicleCart(items[i], 'Honda', 'Accord', 'KR12343'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';
import '../providers/vehicle.dart';
import '../widgets/vehicle_cart.dart';

class VehiclesScreen extends StatefulWidget {
  static const routeName = '/vehicles';

  @override
  _VehiclesScreenState createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final _myController = TextEditingController();

  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  var _newVehicle = Vehicle(
    id: null,
    brand: '',
    model: '',
    registration_no: '',
  );

  Future<void> _addVehicle() async {
    if (_isLoading) {
      return;
    }
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    Users users = Provider.of<Users>(context, listen: false);
    await users.addVehicle(users.currentUser.id, _newVehicle);

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Vehicle> vehicles = Provider.of<Users>(context, listen: true).currentUser.vehicles;
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
                    content: Form(
                      key: _form,
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.92,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  hintText: 'Car brand',
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    letterSpacing: 0.92,
                                  ),
                                ),
                                textAlign: TextAlign.end,
                                onSaved: (value) {
                                  setState(() {
                                    _newVehicle.brand = value;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.92,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  hintText: 'Car model',
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    letterSpacing: 0.92,
                                  ),
                                ),
                                textAlign: TextAlign.end,
                                onSaved: (value) {
                                  setState(() {
                                    _newVehicle.model = value;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.92,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  hintText: 'Registration No.',
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    letterSpacing: 0.92,
                                  ),
                                ),
                                textAlign: TextAlign.end,
                                onSaved: (value) {
                                  setState(() {
                                    _newVehicle.registration_no = value;
                                  });
                                },
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      MaterialButton(
                        elevation: 5.0,
                        onPressed: () {
                          Navigator.of(context).pop();
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
                              _addVehicle();
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
        itemCount: vehicles.length,
        itemBuilder: (ctx, i) => VehicleCart(vehicles[i].id.toString(),
            vehicles[i].brand, vehicles[i].model, vehicles[i].registration_no),
      ),
    );
  }
}

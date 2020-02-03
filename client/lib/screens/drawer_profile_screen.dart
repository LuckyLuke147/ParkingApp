import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/user.dart';
import '../providers/users.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _isLoading = false;

  var _editedUser = User(
    id: null,
    name: '',
    surname: '',
    email: '',
    phoneNo: null,
    password: '',
  );

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _isLoading = true;
      Provider.of<Users>(context).reloadCurrentUser().then((user) {
        setState(() {
          _isLoading = false;
          _editedUser = user;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
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
    if (_editedUser.id != null) {
      await Provider.of<Users>(context, listen: false)
          .updateUser(_editedUser.id, _editedUser);
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 0.92,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text(
              'SAVE',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.92,
              ),
            ),
            splashColor: Colors.transparent,
            onPressed: _saveForm,
          )
        ],
        backgroundColor: Colors.orange,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: ListView(
                padding: EdgeInsets.all(30),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: _width * 0.04,
                              letterSpacing: 0.92,
                              color: Colors.black,
                            ),
                            initialValue: _editedUser.name,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                                color: Colors.black26,
                              ),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              setState(() {
                                _editedUser.name = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Surname',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: _width * 0.04,
                              letterSpacing: 0.92,
                              color: Colors.black,
                            ),
                            initialValue: _editedUser.surname,
                            decoration: InputDecoration(
                              hintText: 'Surname',
                              hintStyle: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                                color: Colors.black26,
                              ),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              setState(() {
                                _editedUser.surname = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Phone number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: _width * 0.04,
                              letterSpacing: 0.92,
                              color: Colors.black,
                            ),
                            initialValue: _editedUser.phoneNo.toString(),
                            decoration: InputDecoration(
                              hintText: 'Phone number',
                              hintStyle: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                                color: Colors.black26,
                              ),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              setState(() {
                                _editedUser.phoneNo = int.parse(value);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: _width * 0.04,
                              letterSpacing: 0.92,
                              color: Colors.black,
                            ),
                            initialValue: _editedUser.email,
                            decoration: InputDecoration(
                              hintText: "email",
                              hintStyle: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                                color: Colors.black26,
                              ),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              setState(() {
                                _editedUser.email = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(
                              fontSize: _width * 0.04,
                              letterSpacing: 0.92,
                              color: Colors.black,
                            ),
                            initialValue: _editedUser.password,
                            decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                                color: Colors.black26,
                              ),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              setState(() {
                                _editedUser.password = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(
                              fontSize: _width * 0.04,
                              letterSpacing: 0.92,
                              color: Colors.black,
                            ),
                            initialValue: _editedUser.password,
                            decoration: InputDecoration(
                              hintText: "confirm password",
                              hintStyle: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                                color: Colors.black26,
                              ),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';
import '../providers/users.dart';
import '../widgets/custom_input_decoration.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/registration';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _nameFocusNode.dispose();
    _surnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  var _newUser = User(
    id: null,
    name: '',
    surname: '',
    email: '',
    phoneNo: null,
    password: '',
  );

  Future<void> _registerForm() async {
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Users>(context, listen: false).addUser(_newUser);

    print('User name: ' + _newUser.name);

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    print('asdasd');
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 0.92,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: _height * 0.05, left: 30, right: 30),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18.0,
                  //color: Color.fromRGBO(121, 121, 121, 1),
                  letterSpacing: 0.92,
                ),
                decoration: buildSignUpInputDecoration('E-mail'),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter mail';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter correct mail';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _newUser.email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                obscureText: true,
                controller: _passwordController,
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 0.92,
                ),
                decoration: buildSignUpInputDecoration('Password'),
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .requestFocus(_confirmPasswordFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  } else if (value.length < 8) {
                    return 'At least 8 characters';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _newUser.password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                obscureText: true,
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 0.92,
                ),
                decoration: buildSignUpInputDecoration('Confirm Password'),
                focusNode: _confirmPasswordFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_nameFocusNode);
                },
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords mismatch';
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 0.92,
                      ),
                      decoration: buildSignUpInputDecoration('Name'),
                      focusNode: _nameFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_surnameFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          _newUser.name = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.92,
                      ),
                      decoration: buildSignUpInputDecoration('Surname'),
                      focusNode: _surnameFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_phoneFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter surname';
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          _newUser.surname = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 0.92,
                ),
                decoration: buildSignUpInputDecoration('Phone number'),
                focusNode: _phoneFocusNode,
                onFieldSubmitted: (_) {
                  _registerForm();
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter phone number';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _newUser.phoneNo = int.parse(value);
                  });
                },
              ),
              SizedBox(height: _height * 0.05),
              Container(
                child: ButtonTheme(
                  height: _height * 0.07,
                  child: RaisedButton(
                      color: Colors.orange,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: _height * 0.025,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.92,
                        ),
                      ),
                      onPressed: () {
                        if (_form.currentState.validate()) {
                          _registerForm();
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

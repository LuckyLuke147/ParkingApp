import 'package:flutter/material.dart';

import '../widgets/custom_input_decoration.dart';
import './overview_user_screen.dart';
import './overview_admin_screen.dart';
import './signUp_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _email, _password;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginForm() async {
    // setState(() {

    // });
    // if () {
    //   await ;
    // } else {
    //   try {
    //     await ;
    //   } catch (error) {
    //     await showDialog(
    //       context: context,
    //       builder: (ctx) => AlertDialog(
    //         title: Text('An error occurred!'),
    //         content: Text('Something went wrong.'),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Okay'),
    //             onPressed: () {
    //               Navigator.of(ctx).pop();
    //             },
    //           )
    //         ],
    //       ),
    //     );
    //   }

    // }
    // setState(() {

    // });
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Form(
          //key: _form,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment(0.0, -1.0),
                child: Image.asset(
                  'assets/logo.png',
                  scale: _height * 0.0009,
                ),
              ),
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
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                },
                //onSaved: (value) {

                // },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                obscureText: true,
                style: TextStyle(
                  fontSize: 18.0,
                  //color: Color.fromRGBO(121, 121, 121, 1),
                  letterSpacing: 0.92,
                ),
                decoration: buildSignUpInputDecoration('Password'),
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (_) {
                  _loginForm();
                },
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                },
                //onSaved: (value) {

                // },
              ),
              SizedBox(height: _height * 0.05),
              Container(
                child: ButtonTheme(
                  height: _height * 0.07,
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: _height * 0.025,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.92,
                      ),
                    ),
                    onPressed: () {
                       Navigator.of(context)
                           .pushNamed(UserOverviewScreen.routeName);
//                       Navigator.of(context)
//                           .pushNamed(AdminOverviewScreen.routeName);
                    },
                  ),
                ),
              ),
              SizedBox(height: _height * 0.02),
              Divider(),
              SizedBox(height: _height * 0.02),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        letterSpacing: 0.92,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.orange,
                          letterSpacing: 0.92,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//@dart=2.9
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void _validateFields() {
    final validSnackBar = SnackBar(
      content: Text(
        'Your fields are correct',
        style: TextStyle(fontSize: 16.0),
      ),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      backgroundColor: Colors.green,
    );
    final invalidSnackBar = SnackBar(
      content:
          Text('Your fields are not correct', style: TextStyle(fontSize: 16.0)),
      action: SnackBarAction(
        label: "Not Valid!",
        textColor: Colors.white,
        onPressed: () {},
      ),
      backgroundColor: Colors.red,
    );
    if (_formKey.currentState.validate()) {
      scaffoldKey.currentState.showSnackBar(validSnackBar);
    //ScaffoldMessenger(child: scaffold());
    } else {
      scaffoldKey.currentState.showSnackBar(invalidSnackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Forms"),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            elevation: 8.0,
            child: Container(
              height: 350,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter your name...";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Your name...",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter your email addresse!";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Your email...",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter strong password:(";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Your password...",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: _validateFields,
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Center(
                            child: Text(
                              "Validate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

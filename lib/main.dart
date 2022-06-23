import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = '';

  DateTime dateTime = DateTime.now();

  void pickDate() {
    // final initialDate = DateTime.now();
    // final newDate = await
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((value) {
      setState(() {
        dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text(
        //   'Data Stroring App',
        //   style: TextStyle(color: Colors.black),
        // ),
      ),
      backgroundColor: Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey, //key for form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: height * 0.04),
              Text(
                'Let\'s rock',
                style: TextStyle(
                  fontSize: 30,
                  // color: Color(0xFF363f93),
                  color: Color(0xFF4C3575),
                ),
              ),
              Text(
                "the Usecase !",
                style: TextStyle(
                  fontSize: 30,
                  // color: Color(0xFF363f93),
                  color: Color(0xFF4C3575),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                    return "Enter correct name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pick your Date',
                  hintText: 'Pick Date',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: pickDate,
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update List',
                    style: TextStyle(
                      fontSize: 22,
                      // color: Color(0xFF363f93),
                      color: Color(0xFF4C3575),
                    ),
                  ),
                  NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // check if form data are valid
                        // your process task ahead if all data are valid
                        final snackBar =
                            SnackBar(content: Text('Submitting form'));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.circle(),
                      // color: Color(0xFF363f93),
                      color: Color(0xFF4C3575),
                      shadowLightColor: Colors.grey,
                      // depth: 25.0,
                      // intensity: 20.0,
                      surfaceIntensity: 0.25,
                    ),
                    child: Icon(
                      Icons.arrow_upward,
                      size: 22.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Text(
                dateTime.month.toString(),
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    'Forgot password',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

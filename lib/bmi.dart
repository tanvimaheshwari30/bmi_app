import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double result = 0.0;

  String _resultReading = "";
  String _resultStatus = "";

  void _doRestart() {
    setState(() {
      _ageController.text = '';
      _weightController.text = '';
      _heightController.text = '';
      _resultStatus = '';
      _resultReading = '';
    });
  }

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || height > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        result = weight / (height * height);
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Alert! UnderWeight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Yeah! Great Shape";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading = "Oops! OverWeight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "OMG! Obese";
          print(_resultReading);
        }
      } else {
        result = 0.0;
      }
    });
    _resultStatus = "Your BMI : ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "BMI",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _doRestart();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "images/bmi.JPG",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.lightBlue,
                            ),
                            labelText: "Age",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "eg: 34",
                            hintStyle: TextStyle(color: Colors.white30)),
                        autofocus: true,
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.insert_chart,
                              color: Colors.lightBlue,
                            ),
                            labelText: "Height(in metre)",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "eg: 5.7",
                            hintStyle: TextStyle(color: Colors.white30)),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.line_weight,
                              color: Colors.lightBlue,
                            ),
                            labelText: "Weight(in Kg)",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "eg: 190",
                            hintStyle: TextStyle(color: Colors.white30)),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _calculateBMI();
                        },
                        child: Text("Calculate"),
                        color: Colors.redAccent,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                child: Column(
                  children: <Widget>[
                    Text(
                      "$_resultStatus",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    Text(
                      "$_resultReading",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Created by: TANVI MAHESHWARI",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

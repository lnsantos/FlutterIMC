import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculo IMC",
    home: HomeWidget(),
  ));
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController weightField = TextEditingController();
  TextEditingController heightField = TextEditingController();

  String labelTextHeaviness = "Your heaviness (Kg)";
  String labelTextHeight = "Your height (Cm)";
  String buttonCalculetor = "Done to calcule";
  String nameAppBar = " Cálculo do IMC ";
  String labelTextInformation = "Please, fill all fields";

  GlobalKey<FormState> form;

  void refreshFields() {
    setState(() {
      if (weightField != null && heightField != null) {
        weightField.text = "";
        heightField.text = "";

        labelTextInformation = "Please fill all field";
      } else
        labelTextInformation = "Require fill all field to calculenw";
    });
  }

  void calculetorImc() {
    double weight = 0.0;
    double height = 0.0;

    weight = double.parse(weightField.text);
    height = double.parse(heightField.text) / 100;

    if (weight != null && height != null || widget == 0.0 && height == 0.0) {
      setState(() {
        var value = weight / (height * 2);

        if (value > 18.5 && value < 25.0)
          labelTextInformation =
              "Your weight is normal (${value.toStringAsPrecision(4)})";
        else if (value > 25.0 && value < 30.0)
          labelTextInformation =
              "Your is above weight (${value.toStringAsPrecision(4)})";
        else if (value > 30.0 && value < 35.0)
          labelTextInformation =
              "Obesidade I (${value.toStringAsPrecision(4)})";
        else if (value > 35 && value < 40.0)
          labelTextInformation =
              "Obsidade II (${value.toStringAsPrecision(4)})";
        else if (value > 40)
          labelTextInformation =
              "Obsesidade III (${value.toStringAsPrecision(4)})";
        else
          labelTextInformation =
              "Abaixo do peso (${value.toStringAsPrecision(4)})";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameAppBar),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              refreshFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.accessibility_new, size: 80.0, color: Colors.white),
                TextFormField(
                  controller: weightField,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0, color: Colors.cyanAccent),
                  decoration: InputDecoration(
                      labelText: labelTextHeaviness,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  cursorRadius: Radius.circular(5.0),
                  validator: (value) {
                    if(value.isEmpty){
                      return "fill this field";
                    }
                  },
                ),
                TextFormField(
                  controller: heightField,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                  decoration: InputDecoration(
                      labelText: labelTextHeight,
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "fill this field";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    height: 60.0,
                    child: RaisedButton(
                      child: Text(
                        buttonCalculetor,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                      onPressed: () {
                          calculetorImc();
                      },
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  labelTextInformation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
    );
  }
}

import 'dart:math';

import 'package:bmi_calculatar/Page_Result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

double high = 25.0;

String resultLst = '';


bool isSelected = true;

int age = 20;

int wight = 40;



double result = wight / pow(high / 100, 2);


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [

          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    isSelected = true;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    isSelected = false;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey[400] : Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          )),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HELGHT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          '${high.round()}',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Slider(
                        min: 1,
                        max: 200,
                        activeColor: Colors.blue,
                        value: high,
                        onChanged: (value) {
                          setState(() {
                            high = value;
                          });

                          print(value);
                        }),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    age--;
                                    setState(() {});
                                  },
                                  backgroundColor: Colors.blue,
                                  mini: true,
                                  child: Icon(Icons.remove)),
                              SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    age++;
                                    setState(() {});
                                  },
                                  mini: true,
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Wight',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$wight",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    wight--;
                                    setState(() {});
                                  },
                                  backgroundColor: Colors.blue,
                                  mini: true,
                                  child: Icon(Icons.remove)),
                              SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {});
                                    wight++;
                                    print(wight);
                                  },
                                  mini: true,
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  double result = wight / pow(high / 100, 2);

                  print(result.round());



                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                age: age,
                                gender: isSelected,
                                result: result.round(),

                              )));
                }),
          )
        ],
      ),
    );
  }
}

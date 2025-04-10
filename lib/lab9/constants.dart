import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.w900);
const kMessageTextStyle = TextStyle(fontSize: 60.0, fontWeight: FontWeight.w400);
const kButtonTextStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
const kConditionTextStyle = TextStyle(fontSize: 100.0);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);

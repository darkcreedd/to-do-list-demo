import 'package:flutter/material.dart';

class DataClass extends ChangeNotifier {
  TextEditingController purposeC = TextEditingController();
  TextEditingController get purposeController => purposeC;

  TextEditingController dateC = TextEditingController();
  TextEditingController get dateController => dateC;

  TextEditingController timeC = TextEditingController();
  TextEditingController get timeController => timeC;

  final List<String> _purposes = []; // You've created a variable here, nice
  List get purpose =>
      _purposes; //How do you want to refer to it from your actual code? Datatype get PreferredName => actual variable

  final List<String> _date = [];
  List get date => _date;

  final List<String> _time = [];
  List get time => _time;

  void dclear() {
    purposeC.clear();
    timeC.clear();
    dateC.clear();
  }

  popFromList(int index) {
    _purposes.removeAt(index);
    _date.removeAt(index);
    notifyListeners();
  }

  void addToList(String purpose, String time, String date) {
    purpose = purposeC.text;
    date = dateC.text;
    time = timeC.text;
    if (purpose != '') {
      _purposes.add(purpose);
      _date.add(date);
      _time.add(time);
      dclear();
      notifyListeners();
    }
  }
}

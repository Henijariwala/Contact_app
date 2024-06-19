import 'package:contact_app_flutter/screen/profile/model/contact_model.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<ContactModel> contactList = [];
  String path = "";
  ContactModel? selectedContact;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  void dateChange(DateTime newDate)
  {
    date = newDate;
    notifyListeners();
  }
  void changeTime( TimeOfDay t1)
  {
    time = t1;
    notifyListeners();
  }

  void addContact(ContactModel model)
  {
    contactList.add(model);
    notifyListeners();
  }

  void addPath(String p1) {
    path = p1;
    notifyListeners();
  }


}

// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Data with ChangeNotifier {
//   String _text = '';
//   List<String> messageHistory = [];
//   final _storage = SharedPreferences.getInstance();
//   Data() {
//     _showHistory().then((value) {
//       notifyListeners();
//     });
//   }

//   String get getText => _text;

//   void changeList(String text) {
//     if (text != '') {
//       messageHistory.add(text);
//       _saveHistory();
//       notifyListeners();
//     }
//   }

//   void remove(index) {
//     messageHistory.removeAt(index);
//     _saveHistory();
//     notifyListeners();
//   }

//   Future<void> _showHistory() async {
//     final storage = await _storage;
//     messageHistory = storage.getStringList('history') ?? [];
//   }

//   Future<void> _saveHistory() async {
//     final storage = await _storage;
//     storage.setStringList('history', messageHistory);
//   }

//   void clearAll() {
//     messageHistory.clear();
//     _saveHistory();
//     notifyListeners();
//   }
// }

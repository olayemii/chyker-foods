import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

Future<bool> getLoginState() async {
  final prefs = await SharedPreferences.getInstance();

  final loginState = prefs.getBool('loginState');
  return loginState;
}

Future<void> setLoginState(bool loginState) async {
  final prefs = await SharedPreferences.getInstance();

  if (loginState) {
    prefs.setBool('loginState', true);
  } else {
    prefs.remove('loginState');
  }
}

Future<void> setFirstTimeState() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("firstTimeState", false);
}

Future<bool> getFirstTimeState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("firstTimeState");
}

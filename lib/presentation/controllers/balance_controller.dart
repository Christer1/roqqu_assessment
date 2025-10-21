import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceController extends GetxController {
  final RxBool isBalanceVisible = true.obs;
  
  void toggleBalanceVisibility() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }
  
  String getDisplayBalance() {

    // I only need to get real balance fort the user if this is a real applicaton
    return isBalanceVisible.value ? '£0.00' : '****';
  }
  
  IconData getBalanceIcon() {
    return isBalanceVisible.value ? Icons.visibility : Icons.visibility_off;
  }
}
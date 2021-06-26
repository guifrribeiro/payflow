import 'package:flutter/material.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillListController {
  final billNotifier = ValueNotifier<List<BillModel>>(<BillModel>[]);
  List<BillModel> get boletos => billNotifier.value;
  set boletos(List<BillModel> value) => billNotifier.value = value;

  BillListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      boletos = response.map((e) => BillModel.fromJson(e)).toList();
    } catch (error) {
      boletos = <BillModel>[];
    }
  }
}
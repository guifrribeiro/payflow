import 'package:flutter/material.dart';

import 'package:payflow/shared/models/bill_model.dart';
import 'package:payflow/shared/widgets/bill_list/bill_list_controller.dart';
import 'package:payflow/shared/widgets/bill_tile/bill_tile_widget.dart';

class BillListWidget extends StatefulWidget {
  final BillListController controller;
  const BillListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BillListWidgetState createState() => _BillListWidgetState();
}
 
class _BillListWidgetState extends State<BillListWidget> {
  final controller = BillListController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BillModel>>(
      valueListenable: controller.billNotifier,
      builder: (_, boletos, __) => Column(
        children: boletos.map((boleto) => BillTileWidget(data: boleto)).toList(),
      )
    );
  }
}
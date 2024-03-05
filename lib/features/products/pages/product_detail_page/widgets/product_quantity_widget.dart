import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/core/resources/components/gaps.dart';
import 'package:kaya/core/resources/components/rounded_border_container.dart';
import 'package:kaya/core/resources/components/text_form_widget.dart';
import 'package:kaya/core/resources/components/text_widget.dart';

class ProductQuantityWidget extends StatefulWidget {
  final Function(int) onValueChanged;
  final int maxQty;
  final int initialQty;
  const ProductQuantityWidget({
    super.key,
    required this.onValueChanged,
    required this.maxQty,
    this.initialQty = 1,
  });

  @override
  State<ProductQuantityWidget> createState() => _ProductQuantityWidgetState();
}

class _ProductQuantityWidgetState extends State<ProductQuantityWidget> {
  late TextEditingController _qtyController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          text: "Select Quantity",
          textSize: TextSize.small,
          fontWeight: FontWeight.w500,
        ),
        gap10,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                _decrementQty();
              },
              child: roundedBorderContainer(
                height: 50,
                width: 40,
                bgColor: buttonColor,
                padding: const EdgeInsets.all(5),
                border: Border.all(color: Colors.grey),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            gap5,
            SizedBox(
              height: 50,
              width: 50,
              child: TextFormWidget(
                fillColor: Colors.white,
                controller: _qtyController,
                hintText: "",
                textAlign: TextAlign.center,
                textInputType: TextInputType.number,
                onChanged: (quantityValue) {
                  log("value = $quantityValue");

                  if (int.parse(quantityValue) > widget.maxQty) {
                    _qtyController.text = widget.maxQty.toString();

                    Fluttertoast.showToast(
                      msg: "Max Quantity is ${widget.maxQty}",
                      webPosition: "center",
                    );
                  }
                },
              ),
            ),
            gap5,
            InkWell(
              onTap: () {
                _incrementQty();
              },
              child: roundedBorderContainer(
                height: 50,
                width: 40,
                bgColor: buttonColor,
                padding: const EdgeInsets.all(5),
                border: Border.all(color: Colors.grey),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _qtyController = TextEditingController(text: widget.initialQty.toString());

    log("max order = ${widget.maxQty}");
  }

  void _incrementQty() {
    if (widget.maxQty == int.parse(_qtyController.text)) {
      Fluttertoast.showToast(
        msg: "Max Quantity Reached",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      return;
    }
    setState(() {
      _qtyController.text = (int.parse(_qtyController.text) + 1).toString();
    });

    widget.onValueChanged(int.parse(_qtyController.text));
  }

  void _decrementQty() {
    int qty = int.parse(_qtyController.text);

    if (qty > 1) {
      setState(() {
        _qtyController.text = (int.parse(_qtyController.text) - 1).toString();
      });
      widget.onValueChanged(int.parse(_qtyController.text));
    } else {
      Fluttertoast.showToast(
        msg: "Quantity must be greater than 1",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

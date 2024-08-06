import 'package:flutter/material.dart';
import 'package:my_roshita/constant.dart';

class RoshitaDetailTextField extends StatelessWidget {
  RoshitaDetailTextField({
    super.key,
    required this.controller,
    required this.lableText,
    required this.enableInt,
  });
  TextEditingController controller;
  String lableText;
  bool enableInt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          keyboardType: enableInt ? TextInputType.number : TextInputType.text,
          //textAlign: TextAlign.end,
          decoration: InputDecoration(
            labelText: lableText,
            //labelStyle: TextStyle(),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 3,
              ),
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(20)),
            //   borderSide: BorderSide(
            //     color: Colors.greenAccent,
            //     width: 3,
            //   ),
            // ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.greenAccent,
                width: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

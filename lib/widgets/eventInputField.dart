import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/utils/utils.dart';

class EventInputField extends StatelessWidget {
  final String fieldName;
  final bool isDescription;
  final bool isNum;
  final controller;
  final color;
  EventInputField({
    @required this.fieldName,
    @required this.controller,
    this.isNum = false,
    this.isDescription = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 2),
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              fieldName.toString() ?? '',
              style: subtitle1.copyWith(color: this.color),
            ),
          ),
          Material(
            elevation: 5.0,
            shadowColor: Colors.black45,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                keyboardType: isNum ? TextInputType.number : TextInputType.text,
                controller: controller,
                maxLines: isDescription ? 3 : null,
                maxLength: isDescription ? 150 : null,
                style: TextStyle(color: Colors.black87),
                validator: (String value) => checkIsValid(
                  fieldName: fieldName,
                  value: value,
                  isDescription: isDescription,
                  isNum: isNum,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  labelText: '$fieldName',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

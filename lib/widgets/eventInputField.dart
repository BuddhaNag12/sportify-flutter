import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/typographyConstants.dart';

class EventInputField extends StatelessWidget {
  final String fieldName;
  final bool isDescription;
  final bool isNum;
  final controller;
  EventInputField({
    @required this.fieldName,
    @required this.isDescription,
    @required this.isNum,
    @required this.controller,
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
              fieldName.toString(),
              style: subtitle1,
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
                validator: (String value) {
                  if (isNum) {
                    var msg;
                    if (!GetUtils.isNum(value)) {
                      msg = 'Enter valid $fieldName';
                    } else {
                      msg = null;
                    }
                    return msg;
                  } else if (isDescription) {
                    var msg;
                    if (!GetUtils.isLengthBetween(value, 0, 150)) {
                      msg = 'Enter valid $fieldName';
                    } else {
                      msg = null;
                    }
                    return msg;
                  } else {
                    if (!GetUtils.isBlank(value)) {
                      var msg;
                      if (!GetUtils.isAlphabetOnly(value)) {
                        msg = 'Enter valid $fieldName';
                      } else {
                        msg = null;
                      }
                      return msg;
                    } else if (value == null || value.isEmpty) {
                      return 'Please enter valid characters';
                    } else {
                      return null;
                    }
                  }
                },
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

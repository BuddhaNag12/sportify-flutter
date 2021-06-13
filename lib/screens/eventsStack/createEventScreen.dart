import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/eventInputField.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';

class CreateEventsScreen extends GetView<EventController> {
  final EventController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.shade700,
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 100,
                  child: Text(
                    "Add An Event",
                    style: headline1,
                  ),
                ),
              ),
              cirCularIcon(imgPath: 'assets/add_event.svg'),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: width,
                  height: double.infinity,
                  color: Get.context.theme.primaryColor,
                  child: SingleChildScrollView(
                    child: Form(
                      key: con.createEventKey,
                      child: Column(
                        children: [
                          Container(
                            width: width - 40,
                            height: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EventInputField(
                                  fieldName: "Event Name",
                                  controller: con.eventNameController,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 2),
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Event Date",
                                          style: subtitle1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width,
                                        height: 45,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              alignment: Alignment.centerLeft),
                                          onPressed: () =>
                                              con.selectDateTime(context),
                                          child: Obx(
                                            () => con
                                                    .pickedDate.value.isNotEmpty
                                                ? Text(
                                                    "Event Date : ${con.pickedDate}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  )
                                                : Text(
                                                    "YYYY:MM:DD ",
                                                    style: TextStyle(
                                                        color: Colors.black87),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GetBuilder<EventController>(builder: (eCon) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 2),
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Event Location",
                                            style: subtitle1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width,
                                          height: 45,
                                          child: ElevatedButton(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: width - 100,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: eCon.pickedLatlng !=
                                                          null
                                                      ? Text(
                                                          "Lat long : ${eCon.pickedLatlng.latitude} ${eCon.pickedLatlng.longitude}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      : Text(
                                                          "Pick Event Location",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                ),
                                                Icon(
                                                    FlutterIcons.map_search_mco,
                                                    color: Colors.teal),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),
                                            onPressed: () =>
                                                eCon.pickEventLocation(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                EventInputField(
                                  fieldName: "Team Size",
                                  isNum: true,
                                  controller: con.eventSizeController,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 2),
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Event Category",
                                    style: subtitle1,
                                  ),
                                ),
                                Container(
                                  width: width,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1,
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                        ),
                                      ]),
                                  child: Obx(
                                    () => DropdownButton(
                                      hint: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Category",
                                        ),
                                      ),
                                      value: con.category.value.isNotEmpty
                                          ? con.category.value
                                          : null,
                                      elevation: 16,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontFamily: "Roboto",
                                      ),
                                      dropdownColor: Colors.tealAccent.shade700,
                                      underline: SizedBox(),
                                      onChanged: (newValue) {
                                        con.changeCategoryValue(newValue);
                                      },
                                      items: categories.map((val) {
                                        return DropdownMenuItem(
                                          value: val,
                                          child: Container(
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.all(4),
                                                width: width - 70,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  val,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 2),
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          "Prizes/certifications",
                                          style: subtitle1,
                                        ),
                                      ),
                                      Container(
                                        width: width,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 1,
                                                color: Colors.grey,
                                                offset: Offset(0, 1),
                                              ),
                                            ]),
                                        child: Obx(
                                          () => DropdownButton(
                                            hint: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Prize",
                                              ),
                                            ),
                                            value: con.prizeCat.value.isNotEmpty
                                                ? con.prizeCat.value
                                                : null,
                                            elevation: 16,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                            ),
                                            dropdownColor:
                                                Colors.tealAccent.shade700,
                                            underline: SizedBox(),
                                            onChanged: (newValue) {
                                              con.setPrizeCat(newValue);
                                            },
                                            items: prizes.map((val) {
                                              return DropdownMenuItem(
                                                value: val,
                                                child: Container(
                                                  child: Center(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      width: width - 70,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Text(
                                                        val,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                EventInputField(
                                  fieldName: "Location name",
                                  controller: con.eventPlaceNameController,
                                ),
                                EventInputField(
                                  fieldName: "Event Description",
                                  isDescription: true,
                                  controller: con.eventDescriptionController,
                                ),
                              ],
                            ),
                          ),
                          spacer(30),
                          Obx(() {
                            return con.isLoading.value == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Center(
                                    child: SizedBox(
                                      width: width - 100,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (con.createEventKey.currentState
                                              .validate()) {
                                            con.createEvent();
                                          }
                                        },
                                        child: Text("Submit"),
                                      ),
                                    ),
                                  );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:sportify/constants/colorConst.dart';

import '../exports/createEventExport.dart';

class EditEventController extends GetxController {
  final EventController eventController = Get.find();
  var id;
  void setEditing(id) {
    eventController.viewEvent(id);
  }

  @override
  void onInit() {
    setEditing(Get.parameters['id']);
    super.onInit();
  }

  @override
  void onClose() {
    eventController.reset();
    super.onClose();
  }
}

class EditEvent extends StatelessWidget {
  final EventController editCon = Get.find();
  final EditEventController edit = Get.put(EditEventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      appBar: MyAppBar(
        isTransparent: true,
        title: 'Edit Event',
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
              Expanded(
                child: Container(
                  width: width,
                  height: double.infinity,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Form(
                      key: editCon.createEventKey,
                      child: Column(
                        children: [
                          Container(
                            width: paddedWidth,
                            height: 650,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EventInputField(
                                  fieldName: "Event Name",
                                  controller: editCon.eventNameController,
                                  fieldStyle: subtitle4,
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
                                          style: subtitle4,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width,
                                        height: 45,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            alignment: Alignment.centerLeft,
                                          ),
                                          onPressed: () =>
                                              editCon.selectDateTime(context),
                                          child: Obx(
                                            () => editCon
                                                    .pickedDate.value.isNotEmpty
                                                ? Text(
                                                    "Event Date : ${editCon.pickedDate}",
                                                    textAlign: TextAlign.start,
                                                    style: subtitle4)
                                                : Text(
                                                    "YYYY:MM:DD ",
                                                    style: subtitle4,
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
                                            style: subtitle4,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width,
                                          height: 45,
                                          child: ElevatedButton(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: eCon.pickedLatlng !=
                                                          null
                                                      ? Text(
                                                          "Lat long : ${eCon.pickedLatlng.latitude} ${eCon.pickedLatlng.longitude}",
                                                          style: subtitle4,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      : Text(
                                                          "Pick Event Location",
                                                          style: subtitle4,
                                                        ),
                                                ),
                                                Spacing.horizontalSpacing(2),
                                                Icon(
                                                  FlutterIcons.map_search_mco,
                                                  color: Colors.teal,
                                                ),
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
                                  controller: editCon.eventSizeController,
                                  fieldStyle: subtitle4,
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
                                          "Event Rewards",
                                          style: subtitle4,
                                        ),
                                      ),
                                      Container(
                                        width: paddedWidth,
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
                                          ],
                                        ),
                                        child: Obx(
                                          () => DropdownButton(
                                            hint: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Text(
                                                "Rewards",
                                              ),
                                            ),
                                            value: editCon
                                                    .prizeCat.value.isNotEmpty
                                                ? editCon.prizeCat.value
                                                : null,
                                            elevation: 5,
                                            style: subtitle1,
                                            dropdownColor: Colors.white,
                                            underline: SizedBox(),
                                            onChanged: (newValue) {
                                              editCon.setPrizeCat(newValue);
                                            },
                                            items: prizes.map((val) {
                                              return DropdownMenuItem(
                                                value: val,
                                                child: Center(
                                                  child: Container(
                                                    padding: EdgeInsets.all(4),
                                                    width: paddedWidth - 24,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        val,
                                                        style: subtitle4,
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
                                          "Event Category",
                                          style: subtitle4,
                                        ),
                                      ),
                                      Container(
                                        width: paddedWidth,
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
                                          ],
                                        ),
                                        child: Obx(
                                          () => DropdownButton(
                                            hint: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              child: Text(
                                                "Category",
                                              ),
                                            ),
                                            value: editCon
                                                    .category.value.isNotEmpty
                                                ? editCon.category.value
                                                : null,
                                            elevation: 5,
                                            style: subtitle1,
                                            dropdownColor: Colors.white,
                                            underline: SizedBox(),
                                            onChanged: (newValue) {
                                              editCon.changeCategoryValue(
                                                newValue,
                                              );
                                            },
                                            items: categories.map((val) {
                                              return DropdownMenuItem(
                                                value: val,
                                                child: Center(
                                                  child: Container(
                                                    padding: EdgeInsets.all(4),
                                                    width: paddedWidth - 24,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        val,
                                                        style: subtitle4,
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
                                  controller: editCon.eventPlaceNameController,
                                  fieldStyle: subtitle4,
                                  // color: Colors.black87,
                                ),
                                EventInputField(
                                  fieldName: "Event Description",
                                  isDescription: true,
                                  controller:
                                      editCon.eventDescriptionController,
                                  fieldStyle: subtitle4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Active",
                                        style: subtitle1,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Obx(
                                        () => Switch(
                                          activeColor:
                                              Colors.tealAccent.shade400,
                                          value: editCon.isEventActive.value,
                                          onChanged: (value) {
                                            editCon.isEventActive(value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacing.verticalSpacing(30),
                          Obx(() {
                            return editCon.isLoading.value == true
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    width: width * 0.90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: width * .60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (editCon
                                                  .createEventKey.currentState
                                                  .validate()) {
                                                editCon.updateEvent();
                                              }
                                            },
                                            child: Text("Update"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.redAccent)),
                                            onPressed: () {
                                              editCon.deleteEvent();
                                            },
                                            child: Text("Delete"),
                                          ),
                                        ),
                                      ],
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

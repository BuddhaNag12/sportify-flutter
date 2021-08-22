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
}

class EditEvent extends StatelessWidget {
  final EventController editCon = Get.find();
  final EditEventController edit = Get.put(EditEventController());
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
                  height: 25,
                  child: Text(
                    "Edit Event",
                    style: headline1,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: width,
                  height: double.infinity,
                  color: Get.context.theme.primaryColor,
                  child: SingleChildScrollView(
                    child: Form(
                      key: editCon.createEventKey,
                      child: Column(
                        children: [
                          Container(
                            width: paddedWidth,
                            height: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EventInputField(
                                  fieldName: "Event Name",
                                  controller: editCon.eventNameController,
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
                                                    style: subtitle3,
                                                  )
                                                : Text(
                                                    "YYYY:MM:DD ",
                                                    style: subtitle3,
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
                                                  child:
                                                      eCon.pickedLatlng != null
                                                          ? Text(
                                                              "Lat long : ${eCon.pickedLatlng.latitude} ${eCon.pickedLatlng.longitude}",
                                                              style: subtitle3,
                                                            )
                                                          : Text(
                                                              "Pick Event Location",
                                                              style: subtitle3,
                                                            ),
                                                ),
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
                                      value: editCon.category.value.isNotEmpty
                                          ? editCon.category.value
                                          : null,
                                      elevation: 16,
                                      style: subtitle3,
                                      dropdownColor: Colors.tealAccent.shade700,
                                      underline: SizedBox(),
                                      onChanged: (newValue) {
                                        editCon.changeCategoryValue(newValue);
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
                                                      BorderRadius.circular(2),
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
                                            value: editCon
                                                    .prizeCat.value.isNotEmpty
                                                ? editCon.prizeCat.value
                                                : null,
                                            elevation: 16,
                                            style: subtitle3,
                                            dropdownColor:
                                                Colors.tealAccent.shade700,
                                            underline: SizedBox(),
                                            onChanged: (newValue) {
                                              editCon.setPrizeCat(newValue);
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
                                                                .circular(2),
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
                                  controller: editCon.eventPlaceNameController,
                                ),
                                EventInputField(
                                  fieldName: "Event Description",
                                  isDescription: true,
                                  controller:
                                      editCon.eventDescriptionController,
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
                                              backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                                            ),
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

import 'package:sportify/constants/colorConst.dart';

import '../exports/createEventExport.dart';

class CreateEventsScreen extends StatelessWidget {
  final EventController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
            color: Colors.white,
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
                            width: paddedWidth,
                            height: 700,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EventInputField(
                                  fieldName: "Event Name",
                                  controller: con.eventNameController,
                                  fieldStyle: subtitle3,
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
                                          style: subtitle3,
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
                                              con.selectDateTime(context),
                                          child: Obx(
                                            () => con
                                                    .pickedDate.value.isNotEmpty
                                                ? Text(
                                                    "Event Date : ${con.pickedDate}",
                                                    textAlign: TextAlign.start,
                                                    style: subtitle4,
                                                  )
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
                                            style: subtitle3,
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
                                  controller: con.eventSizeController,
                                  fieldStyle: subtitle3,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        "Event Category",
                                        style: subtitle3,
                                      ),
                                    ),
                                    Spacing.verticalSpacing(5),
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
                                          value: con.category.value.isNotEmpty
                                              ? con.category.value
                                              : null,
                                          elevation: 5,
                                          style: subtitle3,
                                          dropdownColor: Colors.white,
                                          underline: SizedBox(),
                                          onChanged: (newValue) {
                                            con.changeCategoryValue(newValue);
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        "Rewards",
                                        style: subtitle3,
                                      ),
                                    ),
                                    Spacing.verticalSpacing(5),
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
                                              "Select Rewards",
                                            ),
                                          ),
                                          value: con.prizeCat.value.isNotEmpty
                                              ? con.prizeCat.value
                                              : null,
                                          elevation: 5,
                                          style: subtitle3,
                                          dropdownColor: Colors.white,
                                          underline: SizedBox(),
                                          onChanged: (newValue) {
                                            con.setPrizeCat(newValue);
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
                                EventInputField(
                                  fieldName: "Address",
                                  controller: con.eventPlaceNameController,
                                  fieldStyle: subtitle3,
                                ),
                                EventInputField(
                                  fieldName: "Event Description",
                                  isDescription: true,
                                  controller: con.eventDescriptionController,
                                  fieldStyle: subtitle3,
                                ),
                              ],
                            ),
                          ),
                          Spacing.verticalSpacing(30),
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

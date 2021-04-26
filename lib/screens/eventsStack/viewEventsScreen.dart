import 'package:flutter/material.dart';
import 'package:sportify/controllers/global_Controller.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:sportify/widgets/localWidgets.dart';

class ViewEventsScreen extends StatelessWidget {
  final List categories = <String>[
    'Cricket',
    'Foodball',
    'Basketball',
    'Tennis'
  ];
  final GlobalController eventStore = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    final double width = context.mediaQuery.size.width;

    // String dropdownValue = controller.categoryValue.value;
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
        isAvatar: true,
      ),
      backgroundColor: Colors.tealAccent.shade700,
      endDrawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacer(40.0),
            SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      width: 100,
                      height: 38,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey,
                              offset: Offset(0, 1),
                            ),
                          ],
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Obx(() => DropdownButton(
                            hint: Text(
                              "Category",
                              style: TextStyle(color: Colors.white),
                            ),
                            value: eventStore.category.value.isNotEmpty
                                ? eventStore.category.value
                                : null,
                            icon: const Icon(Icons.sports_baseball_rounded,
                                color: Colors.white),
                            elevation: 16,
                            dropdownColor: Colors.tealAccent.shade700,
                            underline: SizedBox(),
                            onChanged: (newValue) {
                              eventStore.changeCategoryValue(newValue);
                            },
                            items: categories.map((val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(
                                  val,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton.icon(
                      onPressed: () => {},
                      icon: Icon(Icons.gps_fixed_rounded),
                      label: Text("Locations"))
                ],
              ),
            ),
            spacer(30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "All Events nearby you",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              width: width / 2 + 30,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Divider(
                  height: 2,
                  thickness: 2,
                  color: Colors.tealAccent.shade700,
                ),
              ),
            ),
            spacer(10.0),
            Expanded(
              child: buildListView(context),
            )
          ],
        ),
      ),
    );
  }
}

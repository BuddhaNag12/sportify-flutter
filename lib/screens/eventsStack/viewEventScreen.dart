import 'package:flutter/material.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:sportify/widgets/localWidgets.dart';

class ViewEventScreen extends StatelessWidget {
  final List categories = <String>[
    'Cricket',
    'Foodball',
    'Basketball',
    'Tennis'
  ];
  //   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //  void _openDrawer() {
  //     _scaffoldKey.currentState!.openDrawer();
  //   }

  //   void _closeDrawer() {
  //     Navigator.of(context).pop();
  //   }

  @override
  Widget build(BuildContext context) {
    final double width = context.mediaQuery.size.width;

    // final double height = context.mediaQuery.size.height;

    return Scaffold(
      appBar: MyAppBar(isTransparent: false),
      backgroundColor: Colors.grey.shade50,
      endDrawer: MyDrawer(),
      body: Container(
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
                    child: DropdownButton(
                        hint: Text(
                          "Category",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: null,
                        isExpanded: true,
                        icon: const Icon(Icons.sports_baseball_rounded,
                            color: Colors.white),
                        elevation: 16,
                        dropdownColor: Colors.tealAccent.shade700,
                        underline: SizedBox(),
                        onChanged: (newValue) {
                          print(newValue);
                        },
                        items: categories.map((val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList()),
                  )),
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

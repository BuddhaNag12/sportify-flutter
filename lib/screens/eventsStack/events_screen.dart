import 'package:flutter/cupertino.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:sportify/screens/exports/eventExport.dart';

class EventsScreen extends StatelessWidget {
  final EventController viewCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
        isAvatar: true,
      ),
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacing.verticalSpacing(10.0),
              SizedBox(
                width: width,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Search Any Event Eg: place or Cricket",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      isDense: true,
                      prefixIcon: Icon(Icons.search),
                    ),
                    controller: viewCon.searchController,
                    onSubmitted: (_) => viewCon.searchEvents(),
                  ),
                ),
              ),
              Spacing.verticalSpacing(6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "All Events nearby you",
                      style: headline1.copyWith(color: Colors.black54),
                    ),
                  ),
                  Obx(
                    () => IconButton(
                      onPressed: () => {viewCon.sortEvents()},
                      icon: Icon(
                        viewCon.isDesc.value
                            ? CupertinoIcons.sort_down
                            : CupertinoIcons.sort_up,
                      ),
                      color: primaryColor,
                      iconSize: 18,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: width * 0.50,
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
              Obx(
                () => viewCon.isLoading.value == true
                    ? listShimmerLoading()
                    : viewCon.eventLists.isEmpty
                        ? Container(
                            width: width,
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/notFound.svg',
                                      width: 250,
                                      height: 250,
                                    ),
                                  ),
                                ),
                                Text(
                                  literalNotFound,
                                )
                              ],
                            ),
                          )
                        : Expanded(
                            child: buildListView(context, viewCon.eventLists),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

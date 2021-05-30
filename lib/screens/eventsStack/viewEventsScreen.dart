import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:sportify/widgets/localWidgets.dart';
import 'package:sportify/constants/responsiveConst.dart';

class ViewEventsScreen extends GetView<EventController> {
  final EventController viewCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
        isAvatar: true,
      ),
      backgroundColor: Colors.tealAccent.shade700,
      endDrawer: MyDrawer(),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width - 50,
                      child: Container(
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
                            Radius.circular(8),
                          ),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Search Any Event Eg: place or Cricket",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                            isDense: true,
                            prefixIcon: Icon(Icons.search),
                          ),
                          controller: viewCon.searchController,
                          // onChanged: (text) => fetchMovies(),
                          onSubmitted: (text) => viewCon.searchEvents(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Filter By :",
                      style: headline6,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 22, top: 5),
                    child: FittedBox(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        width: 110,
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
                              value: viewCon.category.value.isNotEmpty
                                  ? viewCon.category.value
                                  : null,
                              icon: const Icon(
                                Icons.sports_baseball_rounded,
                                color: Colors.white,
                              ),
                              elevation: 16,
                              dropdownColor: Colors.tealAccent.shade700,
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                viewCon.changeCategoryValue(newValue);
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
                  ),
                ],
              ),
              SizedBox(
                width: 50,
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
                                Text("No data found")
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

import 'package:flutter/cupertino.dart';
import 'package:sportify/screens/eventsStack/my_events.dart';
import 'package:sportify/screens/messaging.dart';
import 'package:sportify/screens/routNotFound.dart';
import 'package:sportify/screens/statistics_dashboard.dart';
import '../exports/eventExport.dart';

class ViewEventsScreen extends GetView<EventController> {
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
        // onVerticalDragDown: (e) => viewCon.handleDrag(e),
        // onVerticalDragCancel: () => viewCon.hideNavBar.value = true,
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          height: 600,
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
              Spacing.verticalSpacing(15.0),
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: width - 140,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
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
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 5),
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Obx(() => DropdownButton(
                                hint: Text(
                                  "Category",
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: viewCon.category.value.isNotEmpty
                                    ? viewCon.category.value
                                    : null,
                                icon: const Icon(
                                  CupertinoIcons.sort_down,
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
              ),
              Spacing.verticalSpacing(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "All Events nearby you",
                  style: headline1,
                ),
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

class ViewEventsScreenTab extends StatelessWidget {
  final EventController _con = Get.find();

  List<Widget> _buildScreens() {
    return [
      Obx(() =>
          _con.isEventMaster.isTrue ? StatisticScreen() : ViewEventsScreen()),
      Obx(() =>
          _con.isEventMaster.isFalse ? CategoriesScreen() : MyEventScreen()),
      MessagingView(),
      MyAccount(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final activeColor = Colors.grey.shade100;
    final inActiveColor = Colors.grey.shade900;
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.home,
          color: Colors.white,
        ),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
        title: ("Home"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.sportscourt,
          color: Colors.white,
        ),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
        title: ("Categories"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble_2_fill,
          color: Colors.white,
        ),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
        title: ("Messages"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.profile_circled,
          color: Colors.white,
        ),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
        title: ("Profile"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PersistentTabView(
        context,
        controller: _con.tabViewController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: accentColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBar: _con.hideNavBar.value,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          adjustScreenBottomPaddingOnCurve: true,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: _con.navBarStyle.value,
      ),
    );
  }
}

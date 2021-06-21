import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/controllers/signinController.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:sportify/screens/authStack/LoginScreen.dart';
import 'package:sportify/screens/eventsStack/createEventScreen.dart';
import 'package:sportify/screens/eventsStack/favoritesEvents.dart';
import 'package:sportify/screens/profileStack/accountScreen.dart';
import 'package:sportify/screens/profileStack/profileScreen.dart';
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
      backgroundColor: primaryColor,
      // endDrawer: MyDrawer(),
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
              spacer(25.0),
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
              spacer(20.0),
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
  final AuthController _auth = Get.find();
  SignInController con;

  List<Widget> _buildScreens() {
    return [
      ViewEventsScreen(),
      Obx(() => _auth.isLoggedIn.isTrue ? CreateEventsScreen() : LoginScreen()),
      MyAccount(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: primaryColorLight,
        inactiveColorPrimary: primaryColorDark,
      ),
      PersistentBottomNavBarItem(
        icon: Obx(
          () => _auth.isLoggedIn.isTrue
              ? Icon(
                  CupertinoIcons.plus_app_fill,
                  color: Colors.white,
                )
              : Icon(
                  FlutterIcons.login_ant,
                  color: Colors.white,
                ),
        ),
        title: _auth.isLoggedIn.isTrue ? ("Add Event") : ("Login"),
        activeColorSecondary: primaryColorLight,
        activeColorPrimary: primaryColorLight,
        inactiveColorPrimary: primaryColorDark,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: primaryColorLight,
        inactiveColorPrimary: primaryColorDark,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _auth.isLoggedIn.isFalse ? con = Get.put(SignInController()) : null;
    return PersistentTabView(
      context,
      controller: _con.tabViewController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: accentColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        adjustScreenBottomPaddingOnCurve: true,
        colorBehindNavBar: Colors.white,
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
      navBarStyle: NavBarStyle.style1,
    );
  }
}

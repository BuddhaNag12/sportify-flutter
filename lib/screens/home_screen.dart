import 'package:flutter/cupertino.dart';
import 'package:sportify/screens/eventsStack/events_screen.dart';
import 'package:sportify/screens/eventsStack/my_events.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:sportify/screens/statistics_dashboard.dart';
import 'exports/eventExport.dart';

class HomeScreenTab extends StatelessWidget {
  final EventController _con = Get.find();

  List<Widget> _buildScreens() {
    return [
      Obx(() =>
          _con.isEventMaster.isFalse ? EventsScreen() : StatisticScreen()),
      Obx(() =>
          _con.isEventMaster.isFalse ? CategoriesScreen() : MyEventScreen()),
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
      ),
      PersistentBottomNavBarItem(
        icon: Obx(
          () => _con.isEventMaster.isFalse
              ? Icon(
                  CupertinoIcons.sportscourt,
                  color: Colors.white,
                )
              : Icon(
                  FlutterIcons.add_mdi,
                  color: Colors.white,
                ),
        ),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(
      //     CupertinoIcons.chat_bubble_2_fill,
      //     color: Colors.white,
      //   ),
      //   activeColorPrimary: activeColor,
      //   inactiveColorPrimary: inActiveColor,
      // ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.profile_circled,
          color: Colors.white,
        ),
        activeColorPrimary: activeColor,
        inactiveColorPrimary: inActiveColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: accentColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: false,
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
      navBarStyle: NavBarStyle.style1,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/models/accountSettingsModel.dart';
import 'package:sportify/models/settingsModel.dart';
import 'package:sportify/models/sliverListModel.dart';

const List categories = <String>[
  'Cricket',
  'Football',
  'Basketball',
  'Tennis',
  "All"
];
const List prizes = <String>[
  'Trophies',
  'Money as reward',
  'Certifications',
  'Other'
];

List<NavBarStyle> bottomBarStyles = NavBarStyle.values.take(10).toList();
final navBarStyleStore = GetStorage();
final eventPlannerModeStore = GetStorage();

final List<AccountSettingModel> generalSettings = [
  AccountSettingModel(
      name: 'Settings', route: '/setting', icon: CupertinoIcons.settings),
  AccountSettingModel(name: 'Invite Friend', route: '/', icon: Icons.share),
  AccountSettingModel(name: 'Support', route: '/', icon: Icons.support),
  AccountSettingModel(name: 'About', route: '/', icon: Icons.info),
];
final List<SettingModel> settingsList = [
  SettingModel(
    title: 'Notifications',
    route: '/notification',
    action: null,
  ),
  SettingModel(title: 'Terms And Services', route: '/'),
  SettingModel(title: 'Privacy Policy', route: '/'),
];
final List<SliverListGridItems> sliverGridListItems = [
  SliverListGridItems(
    title: 'Football',
    route: '/cat/football',
    icon: Icons.sports_football,
  ),
  SliverListGridItems(
    title: 'Basketball',
    route: '/cat/basketball',
    icon: Icons.sports_football,
  ),
  SliverListGridItems(
    title: 'Cricket',
    route: '/cat/cricket',
    icon: Icons.sports_football,
  ),
  SliverListGridItems(
    title: 'Chess',
    route: '/cat/chess',
    icon: Icons.sports_football,
  ),
  SliverListGridItems(
    title: 'Hockey',
    route: '/cat/hockey',
    icon: Icons.sports_football,
  ),
  SliverListGridItems(
    title: 'Tennis',
    route: '/cat/tenis',
    icon: Icons.sports_football,
  )
];

enum UserRoll { participating, eventmaster }
enum DialogType { info, warning, success }

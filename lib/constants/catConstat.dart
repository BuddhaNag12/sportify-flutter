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

const String imgUri =
    'https://images.unsplash.com/photo-1505250469679-203ad9ced0cb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';

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
      title: 'Football', route: '/cat/football', backgroudImage: imgUri),
  SliverListGridItems(
      title: 'Basketball', route: '/cat/basketball', backgroudImage: imgUri),
  SliverListGridItems(
      title: 'Cricket', route: '/cat/cricket', backgroudImage: imgUri),
  SliverListGridItems(
      title: 'Chess', route: '/cat/chess', backgroudImage: imgUri),
  SliverListGridItems(
      title: 'Hockey', route: '/cat/hockey', backgroudImage: imgUri),
  SliverListGridItems(
      title: 'Tennis', route: '/cat/tenis', backgroudImage: imgUri),
];

enum UserRoll { participating, eventmaster }

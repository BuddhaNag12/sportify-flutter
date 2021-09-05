part of 'app_pages.dart';
abstract class Routes{
  static const ROOT  = '/';
  static const SPLASH='/splash';
  static const LOGIN = '/signin';
  static const SIGNUP = '/signup';
  static const CREATE_EVENTS = '/create';
  static const JOIN_EVENTS = '/join/:id';
  static const HOME = '/home';
  static const VIEW_EVENT = '/view_event/:id';
  static const PROFILE = '/profile';
  static const ACCOUNT = '/account';
  static const CATEGORIES = '/categories';
  static const SETTINGS  = "/setting";
  static const CATVIEW  = "/cat/:id";
  static const MY_EVENTS  = "/my_events";
  static const FABORITE  = "/favorite";
  static const MANAGE  = "/manage";
  static const EDIT  = "/edit/:id";
  static const NOTIFICATION  = "/notification";
  static const ABOUT  = "/about";
  static const PRIVACY  = "/privacy";
  static const TERMS  = "/terms";
  static const SUPPORT  = "/support";
}
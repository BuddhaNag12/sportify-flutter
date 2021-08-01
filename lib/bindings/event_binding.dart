import 'package:get/get.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/controllers/statisticController.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(
      () => EventController(),
      fenix: true,
    );
  }
}

class StatisticsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticController>(
      () => StatisticController(),
      fenix: true,
    );
  }
}

import 'package:get/get.dart';
import 'package:sportify/controllers/eventController.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(
      () => EventController(),
      // fenix: true,
    );
  }
}

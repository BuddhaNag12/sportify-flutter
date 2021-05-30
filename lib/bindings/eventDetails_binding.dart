import 'package:get/get.dart';
import 'package:sportify/controllers/eventDetailsController.dart';


class EventDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailsController>(
      () => EventDetailsController(),
      fenix: true,
    );
  }
}

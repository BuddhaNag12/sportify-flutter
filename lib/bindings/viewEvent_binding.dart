import 'package:get/get.dart';
import 'package:sportify/controllers/viewEventController.dart';

class ViewEventBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewEventController>(
      () => ViewEventController(),
      fenix: true,
    );
  }
}

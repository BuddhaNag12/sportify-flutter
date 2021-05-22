import 'package:get/get.dart';
import 'package:sportify/controllers/gMapController.dart';

class ViewEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GmapControllerForViewEvent>(
      () => GmapControllerForViewEvent(),
      fenix: true,
    );
  }
}

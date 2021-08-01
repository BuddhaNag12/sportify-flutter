import 'package:sportify/models/chartModel.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import './exports/event_exports.dart';

class StatisticController extends GetxController {
  final AuthController auth = Get.find();
  var isLoading = false.obs;
  RxList<CategoriesModel> totalChartData = RxList<CategoriesModel>();
  var totalEvents = 0.obs;
  final EventController stat = Get.find();
  final AuthController _auth = Get.find();
  var myEvents;
  var categories;
  Map<String, int> totalCategories = {};
  @override
  void onReady() {
    this.getMyEvents();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getMyEvents() {
    this.totalChartData.value = [];
    this.totalEvents.value = 0;
    this.totalCategories = {};
    categories = [];
    
    if (_auth.user != null) {
      myEvents =
          stat.eventLists.where((e) => e.userId == _auth.stateUser?.value?.uid);
      totalEvents.value = myEvents.length;
      categories = myEvents.map((e) => e.category).toList();

      categories.forEach((i) => totalCategories['$i'] =
          totalCategories.containsKey('$i') ? totalCategories['$i'] + 1 : 1);
      totalCategories.keys.forEach((element) {
        totalChartData.add(CategoriesModel(element, totalCategories[element],
            Colors.teal[totalCategories[element] * 100]));
      });
      // print(totalCategories);
    }
  }
}

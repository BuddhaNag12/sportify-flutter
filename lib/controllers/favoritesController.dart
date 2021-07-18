import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:share/share.dart';

class FavoriteController extends GetxController {
  RxList<EventsList> favoriteEvents = RxList<EventsList>();
  final AuthController _auth = Get.find();
  final EventController evts = Get.find();
  var isLoading = false.obs;

  @override
  void onInit() {
    isLoading.value = true;
    favEvts
        .where('user_id', isEqualTo: _auth.stateUser.value.uid)
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((data) {
        if (data['evt_favs'].length > 0) {
          data['evt_favs'].forEach((value) {
            var lists = evts.eventLists.where((evts) => evts.id == value);
            favoriteEvents.addAll(lists);
            isLoading.value = false;
          });
        } else {
          isLoading.value = false;
        }
      });
    }).catchError((onError) {
      print(onError);
      isLoading.value = false;
    });
    super.onInit();
  }

  void removefavoriteEvent(id, context) {
    favEvts.doc(_auth.stateUser.value.uid).get().then((value) {
      if (value.data()['evt_favs'].contains(id)) {
        final filteredEvents =
            value.data()['evt_favs'].where((i) => i != id).toList();
        favEvts.doc(_auth.stateUser.value.uid).set({
          'evt_favs': [...filteredEvents],
          'user_id': _auth.stateUser.value.uid,
        }).then((val) {
          var index = favoriteEvents.indexWhere((element) => element.id == id);
          favoriteEvents.removeAt(index);
          Navigator.pop(context, "remove");
          showMessageDialog("Removed from favorite");
        }).catchError((onError) {
          showMessageDialog("Error adding to favorite");
        });
      }
    });
  }

  void shareEvent(id, context) {
    var obj = evts.eventLists.where((evts) => evts.id == id).single;
    String eventname = "Event: ${obj.name}\n";
    String localtion = "Location : ${obj.place}\n";
    String date = "Event Date : ${obj.date}\n";
    String cat = "Category : ${obj.category}\n";
    String desc = "Description : ${obj.description}\n";
    String prize = "Prize: ${obj.prize}";
    Share.share(
        'Event by Sportify\n${eventname + localtion + date + cat + desc + prize}',
        subject: 'Shared via sportify');
    Navigator.pop(context, "share");
  }
}

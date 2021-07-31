import './exports/event_exports.dart';

class StatisticController extends GetxController {
  final AuthController auth = Get.find();
  var isLoading = false.obs;
  RxList<EventsList> myEvents = RxList<EventsList>();

  @override
  void onInit() {
    this.getAllEvents();
    super.onInit();
  }

  void getAllEvents() {
    print(auth.stateUser?.value?.uid);
    if (auth.isLoggedIn.isTrue) {
      this.isLoading.value = true;
      events
          .where('user_id', isEqualTo: auth.stateUser.value.uid)
          .get()
          .then((value) => {
                value.docs.forEach((QueryDocumentSnapshot element) {
                  myEvents.add(EventsList.fromFirestore(element.data()));
                  this.isLoading.value = false;
                  print(myEvents.first);
                }),
                this.isLoading.value = false
              })
          .catchError((_) => {this.isLoading.value = false});
    }
  }
}

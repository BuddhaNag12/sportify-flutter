import './exports/event_exports.dart';

class EventController extends GetxController with SingleGetTickerProviderMixin {
  // for add event form
  LatLng pickedLatlng;
  DateTime selectedDate = DateTime.now();
  var pickedDate = ''.obs;
  var category = ''.obs;
  var prizeCat = ''.obs;
  var isLoading = false.obs;
  var isEventMaster = false.obs;

  RxList<EventsList> eventLists = RxList<EventsList>();
  /* Global keys */
  final GlobalKey<FormState> createEventKey = GlobalKey<FormState>();
  var selectedIndex = 0.obs;

  // CONTROLLERS
  final AuthController _auth = Get.find();
  // PersistentTabController tabViewController;
  TabController tabController;
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventSizeController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController eventPlaceNameController =
      TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();
  // ScrollController scrollController;

  // Classes
  final DataToFirestore fs = DataToFirestore();

  @override
  void onReady() {
    _initializeTabController();
    _getEventsFromFirestore();
    super.onReady();
  }

  @override
  void onInit() {
    _checkIsEventPlanner();
    // scrollController = ScrollController();
    // scrollController.addListener(_scrollListener);
    super.onInit();
  }

  // _scrollListener() {
  //   if (scrollController.offset >= scrollController.position.maxScrollExtent &&
  //       !scrollController.position.outOfRange) {
  //     print(scrollController.offset);
  //     _getEventsFromFirestore(15);
  //   }
  // }

  @override
  void onClose() {
    eventNameController.dispose();
    eventSizeController.dispose();
    searchController.dispose();
    eventPlaceNameController.dispose();
    eventDescriptionController.dispose();
    tabController.dispose();
    super.onClose();
  }

  void _checkIsEventPlanner() {
    if (eventPlannerModeStore.hasData('isPlanner') &&
        !_auth.stateUser.value.isBlank) {
      this.isEventMaster.value = eventPlannerModeStore.read('isPlanner');
    } else {
      this.isEventMaster.value = false;
    }
  }

  void _reset() {
    eventNameController.clear();
    eventSizeController.clear();
    eventDescriptionController.clear();
    eventPlaceNameController.clear();
    pickedDate.value = '';
    pickedLatlng = null;
    prizeCat.value = '';
    category.value = '';
    update();
  }

  void _showDialog(String text) {
    Get.defaultDialog(
      title: 'warning',
      titleStyle: TextStyle(color: Colors.orange),
      middleText: text,
      backgroundColor: Colors.teal,
      confirm: TextButton(
        onPressed: () => Get.back(),
        child: Text(
          "Close",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _getEventsFromFirestore() async {
    this.isLoading.value = true;
    try {
      final res = await events.get();
      res.docs.forEach((QueryDocumentSnapshot element) {
        eventLists.add(EventsList.fromFirestore(element.data()));
      });
      this.isLoading.value = false;
    } catch (e) {
      this.isLoading.value = false;
      return e;
    }
  }

  void createEvent() async {
    this.isLoading.value = true;
    if (category.value.isBlank) {
      _showDialog('Please select a Category');
    } else if (pickedDate.value.isBlank) {
      _showDialog('Please select a Date');
    } else if (prizeCat.value.isBlank) {
      _showDialog('Please select a Prize category');
    } else if (pickedLatlng == null) {
      _showDialog('Please select a location');
    } else {
      try {
        final res = await fs.addEvent(
          eventName: eventNameController.text,
          date: pickedDate.value,
          cat: category.value,
          location: pickedLatlng,
          size: eventSizeController.text,
          desc: eventDescriptionController.text,
          place: eventPlaceNameController.text.trim(),
          prize:prizeCat.value,
        );
        if (res.isNotEmpty) {
          Get.snackbar(
            'success',
            "Event successfully  added ",
            colorText: Colors.white,
          );
          _reset();
          this.isLoading.value = false;
        }
      } catch (e) {
        this.isLoading.value = false;
        Get.snackbar('Failure', "Failed to add Event");
      }
    }
  }

  void _initializeTabController() {
    tabController = TabController(
      initialIndex: selectedIndex.value,
      length: 2,
      vsync: this,
    );
  }

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime dPicked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (dPicked != null) {
      pickedDate.value = dateFormat.format(dPicked);
    }
  }

  void pickEventLocation(context) async {
    LocationResult result = await showLocationPicker(
      context,
      "AIzaSyDBaBOd2W_uUHMgjKdTgxsio3EhrEKqPVg",
      initialCenter: LatLng(31.1975844, 29.9598339),
      myLocationButtonEnabled: true,
      layersButtonEnabled: true,
      appBarColor: Colors.tealAccent.shade700,
      desiredAccuracy: LocationAccuracy.high,
      searchBarBoxDecoration: BoxDecoration(
        color: Colors.transparent,
        // backgroundBlendMode: BlendMode.difference
      ),
      requiredGPS: true,
      hintText: "Pick an event point",
    );

    if (result != null) {
      eventPlaceNameController.text = result.address;
      Get.snackbar(
        "Info",
        'Location picked successfully ${result.latLng}',
        colorText: Colors.white,
        barBlur: 1.5,
        icon: Icon(
          Icons.info_rounded,
          color: Colors.white,
        ),
        isDismissible: true,
        leftBarIndicatorColor: Colors.red,
        shouldIconPulse: true,
        borderRadius: 8,
        overlayBlur: 2.0,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 4),
      );
      pickedLatlng = result.latLng;
      update();
    }
  }

  void changeCategoryValue(String newVal) async {
    this.category.value = newVal;
    eventLists.clear();
    this.isLoading.value = true;
    if (this.category.value == "All") {
      _getEventsFromFirestore();
    }
    try {
      final res =
          await events.where('category', isEqualTo: this.category.value).get();
      res.docs.forEach((QueryDocumentSnapshot element) {
        eventLists.add(EventsList.fromFirestore(element.data()));
      });
      this.isLoading.value = false;
    } catch (e) {
      this.isLoading.value = false;
      return e;
    }
  }

  void searchEvents() async {
    this.isLoading.value = true;
    eventLists.clear();
    try {
      if (searchController.text.isBlank) {
        _getEventsFromFirestore();
      }
      final query = await events
          .where(
            'place',
            isEqualTo: searchController.text.toLowerCase().trim(),
          )
          .get();
      final query2 = await events
          .where(
            'category',
            isEqualTo: this.category.isNotEmpty
                ? this.category.value
                : searchController.text.capitalize.trim(),
          )
          .get();
      query.docs.forEach((QueryDocumentSnapshot element) {
        eventLists.add(EventsList.fromFirestore(element.data()));
      });
      query2.docs.forEach((QueryDocumentSnapshot element) {
        eventLists.add(EventsList.fromFirestore(element.data()));
      });
      this.isLoading.value = false;
    } catch (e) {
      this.isLoading.value = false;
      return e;
    }
  }

  void setEventPlannerMode(val) {
    if (_auth.isLoggedIn.isFalse) {
      showMessageDialog('You are not Logged In');
      return;
    } else {
      authUsers.doc(_auth.stateUser.value.uid).set(
        {'isEventMaster': val, 'role': val ? "Event Master" : "Participant"},
        SetOptions(merge: true),
      );
      isEventMaster.value = val;
      eventPlannerModeStore.write('isPlanner', val);
    }
  }

  void setPrizeCat(String newVal) {
    this.prizeCat.value = newVal;
  }
}

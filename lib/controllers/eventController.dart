import 'package:sportify/screens/exports/eventExport.dart';
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
  RxBool isDesc = true.obs;
  var updateId = '';
  /* Global keys */
  final GlobalKey<FormState> createEventKey = GlobalKey<FormState>();
  var selectedIndex = 0.obs;

  // CONTROLLERS
  final AuthController _auth = Get.find();
  TabController tabController;
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventSizeController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController eventPlaceNameController =
      TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();

  // Classes
  final DataToFirestore fs = DataToFirestore();

  @override
  void onReady() {
    _initializeTabController();
    super.onReady();
  }

  @override
  void onInit() {
    _checkIsEventPlanner();
    _getEventsFromFirestore();
    super.onInit();
  }

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

  void viewEvent(id) async {
    try {
      this.isLoading.value = true;
      final res = await events.doc(id).get();
      updateId = res.id;
      setEditedValues(EventsList.fromFirestore(res.data()));
      this.isLoading.value = false;
    } catch (e) {
      print(e);
      this.isLoading.value = false;
    }
  }

  void _checkIsEventPlanner() {
    if (eventPlannerModeStore.hasData('isPlanner') &&
        !_auth.stateUser.value.isBlank) {
      this.isEventMaster.value = eventPlannerModeStore.read('isPlanner');
    } else {
      this.isEventMaster.value = false;
    }
  }

  void reset() {
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
    eventLists.clear();
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
      this.isLoading.value = false;
    } else if (pickedDate.value.isBlank) {
      _showDialog('Please select a Date');
      this.isLoading.value = false;
    } else if (prizeCat.value.isBlank) {
      _showDialog('Please select a Prize category');
      this.isLoading.value = false;
    } else if (pickedLatlng == null) {
      _showDialog('Please select a location');
      this.isLoading.value = false;
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
          prize: prizeCat.value,
        );
        if (res.isNotEmpty) {
          Get.snackbar('success', "Event successfully added ",
              colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
          reset();
          _getEventsFromFirestore();
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
      lastDate: DateTime(DateTime.now().year + 2),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
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
      ),
      requiredGPS: true,
      hintText: "Pick an event point",
    );

    if (result != null) {
      eventPlaceNameController.text = result.address;
      pickedLatlng = result.latLng;
      update();
    }
  }

  setEditedValues(EventsList editEventDetails) {
    eventNameController.text = editEventDetails.name;
    pickedDate.value = editEventDetails.date;
    eventSizeController.text = editEventDetails.teamSize;
    category.value = editEventDetails.category;
    prizeCat.value = editEventDetails.prize;
    eventPlaceNameController.text = editEventDetails.place;
    eventDescriptionController.text = editEventDetails.description;
    pickedLatlng = LatLng(
      editEventDetails.location.latitude,
      editEventDetails.location.longitude,
    );
  }

  void updateEvent() async {
    this.isLoading.value = true;
    try {
      final res = await fs.updateEvent(
        id: updateId,
        eventName: eventNameController.text,
        date: pickedDate.value,
        cat: category.value,
        location: pickedLatlng,
        size: eventSizeController.text,
        desc: eventDescriptionController.text,
        place: eventPlaceNameController.text.trim(),
        prize: prizeCat.value,
      );
      if (res.isNotEmpty) {
        showDefaultDialog("Event successfully Updated", DialogType.info);
        _getEventsFromFirestore();
        this.isLoading.value = false;
      }
    } catch (e) {
      this.isLoading.value = false;
      showDefaultDialog("Failed to update Event", DialogType.warning);
    }
  }

  void deleteEvent() async {
    this.isLoading.value = true;
    try {
      await events.doc(updateId).delete();
      Get.back();
      showDefaultDialog("Event successfully Deleted", DialogType.info);
      this.isLoading.value = false;
    } catch (e) {
      this.isLoading.value = false;
      showDefaultDialog("Failed to add Event", DialogType.warning);
    }
  }

  void sortEvents() async {
    this.isDesc.toggle();
    eventLists.clear();
    this.isLoading.value = true;
    var res;
    try {
      res = await events.orderBy('name', descending: isDesc.value).get();
      res.docs.forEach((QueryDocumentSnapshot element) {
        eventLists.add(EventsList.fromFirestore(element.data()));
      });
      this.isLoading.value = false;
    } catch (e) {
      this.isLoading.value = false;
      _showDialog('Error: $e');
    }
  }

  changeCategoryValue(String newVal) {
    this.category.value = newVal;
  }

  Future<List<QuerySnapshot>> getResolveResponse() async {
    var response = await Future.wait([
      events
          .where(
            'category',
            isEqualTo: this.category.isNotEmpty
                ? this.category.value
                : searchController.text.capitalize.trim(),
          )
          .get(),
    ]);
    return response;
  }

  void searchEvents() async {
    this.isLoading.value = true;
    eventLists.clear();
    try {
      if (searchController.text.isBlank) {
        _getEventsFromFirestore();
      }
      var response = await getResolveResponse().then((value) => value);
      response.forEach((res) {
        res.docs.forEach((element) {
          eventLists.add(EventsList.fromFirestore(element.data()));
        });
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

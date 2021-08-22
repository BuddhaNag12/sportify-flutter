import 'package:sportify/controllers/exports/event_exports.dart';

class ManageEventsController extends GetxController {
  RxBool isMultipleSelected = false.obs;
  final AuthController auth = Get.find();
  RxBool isDocsExist = false.obs;

  void selectMultiple() {
    this.isMultipleSelected.toggle();
  }

  void deleteAllEvents() {
    Get.defaultDialog(
      middleText: "Are you sure you want to delete all events ?",
      title: "Confirm",
      middleTextStyle: TextStyle(color: Colors.black),
      radius: 4,
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text("Cancel"),
      ),
      confirm: TextButton(
        onPressed: () => _deleteEvents(),
        child: Text(
          "Confirm",
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }

  void _deleteEvents() {
    events.get().then(
          (value) => {
            value.docs.forEach((element) {
              if (element.data()['user_id'] == auth.stateUser.value.uid) {
                element.reference.delete();
                Get.snackbar('Deleted', "All Events has been deleted");
                this.isMultipleSelected.toggle();
              }
            })
          },
        );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:sportify/constants/catConstat.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/controllers/profileController.dart';
import 'package:sportify/global_widgets/InputField.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/eventInputField.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController _auth = Get.find();
  final ProfileController _profileCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isAvatar: false,
        isTransparent: false,
      ),
      backgroundColor: Colors.tealAccent.shade700,
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                child: Center(
                  child: Text(
                    "Profile",
                    style: headline2.copyWith(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Obx(
                  () => _auth.isLoggedIn.value == true
                      ? Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: ClipOval(
                                  child: Image.network(
                                    'https://ui-avatars.com/api/?name=${_auth.fireStoreUser.value.email.characters.characterAt(0)}',
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Stack(
                            children: [
                              Positioned(
                                child: Icon(
                                  FlutterIcons.user_ant,
                                  size: 50,
                                  color: Colors.tealAccent.shade700,
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: width,
                  height: height,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _profileCon?.profileFormKey,
                      child: Column(
                        children: [
                          Container(
                            width: paddedWidth,
                            height: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EventInputField(
                                  controller: _profileCon.nameController,
                                  fieldName: 'Name',
                                  color: Colors.black,
                                  isNum: false,
                                  isDescription: false,
                                ),
                                EmailInputField(
                                  con: _profileCon.emailController,
                                  label: "Email",
                                  enabled: false,
                                  color: Colors.black,
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Participant"),
                                      Radio<UserRoll>(
                                        value: UserRoll.participating,
                                        groupValue: _profileCon.role.value,
                                        onChanged: (UserRoll value) {
                                          _profileCon.changeRole(value);
                                        },
                                      ),
                                      Text("Event Master"),
                                      Radio<UserRoll>(
                                        value: UserRoll.eventmaster,
                                        groupValue: _profileCon.role.value,
                                        onChanged: (UserRoll value) {
                                          _profileCon.changeRole(value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: Obx(
                                    () => _profileCon.isLoading.isTrue
                                        ? CircularProgressIndicator()
                                        : SizedBox(
                                            width: width - 100,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (_profileCon
                                                    .profileFormKey.currentState
                                                    .validate()) {
                                                  _profileCon.updateProfile();
                                                }
                                              },
                                              child: Text("Update"),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

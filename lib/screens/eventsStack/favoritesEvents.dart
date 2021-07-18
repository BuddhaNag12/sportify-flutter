import 'package:flutter/material.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/controllers/authController.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/controllers/favoritesController.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:sportify/screens/exports/eventExport.dart';

class FavoriteEvents extends StatelessWidget {
  final AuthController auth = Get.find();
  final FavoriteController _favController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isTransparent: false),
      body: Container(
        width: width,
        height: double.infinity,
        child: Obx(
          () => auth.stateUser.value?.uid == null
              ? Container(
                  width: width,
                  height: 250,
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/notFound.svg',
                            width: 250,
                            height: 250,
                          ),
                        ),
                      ),
                      Text(
                        "Oops ... You Need To Login First",
                      )
                    ],
                  ),
                )
              : Obx(
                  () => _favController.isLoading.isTrue
                      ? Center(child: CircularProgressIndicator())
                      : _favController.favoriteEvents.length > 0
                          ? ListView(
                              children: [
                                ListTile(
                                  title: Text(
                                    "favorite Events",
                                    style: headline1,
                                  ),
                                ),
                                ..._favController.favoriteEvents.map(
                                  (element) => Card(
                                    elevation: 2,
                                    child: ListTile(
                                      leading: Icon(Icons.event),
                                      trailing: Card(
                                        elevation: 0,
                                        child: PopupMenuButton(
                                          itemBuilder: (BuildContext context) =>
                                              [
                                            PopupMenuItem(
                                              value: "remove",
                                              child: TextButton(
                                                onPressed: () {
                                                  _favController
                                                      .removefavoriteEvent(
                                                          element.id, context);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                        color: Colors.redAccent,
                                                      ),
                                                    ),
                                                    Icon(
                                                      FlutterIcons
                                                          .remove_circle_mdi,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: "share",
                                              child: TextButton(
                                                onPressed: () {
                                                  _favController.shareEvent(
                                                      element.id, context);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "Share Event",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                    ),
                                                    Icon(
                                                      FlutterIcons.share_2_fea,
                                                      color: Colors.greenAccent,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      title: Text(
                                        element.name.toUpperCase(),
                                        style: headline5,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      onTap: () => Get.toNamed(
                                          '/view_event/${element.id}'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No favorite Event Found",
                                    style: headline1,
                                  ),
                                  Spacing.verticalSpacing(10),
                                  SvgPicture.asset(
                                    'assets/notFav.svg',
                                    width: 300,
                                    height: 300,
                                  ),
                                ],
                              ),
                            ),
                ),
        ),
      ),
    );
  }
}

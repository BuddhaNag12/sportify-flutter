import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/eventDetailsController.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/models/eventModel.dart';
import 'package:sportify/screens/exports/viewEvtexport.dart';

/// sizes for setting spacing
/// by defining vertical [height] horizontal [width].
/// [height] or [width] not provide then default spacing is [double 5]
class Spacing {
  static Widget verticalSpacing([double height]) {
    return SizedBox(height: height ?? 5);
  }

  static Widget horizontalSpacing([double width]) {
    return SizedBox(width: width ?? 5);
  }
}

/*

  ListView 
  Events cards view

*/
Widget buildListView(BuildContext context, List<EventsList> eventLists) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: eventLists.length,
      itemBuilder: (_, i) {
        return AnimationConfiguration.staggeredList(
          position: i,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: Opacity(
                opacity: eventLists[i].active ? 1.0 : 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.grey,
                        offset: Offset(0, 1),
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp,
                      colors: [Colors.grey.shade200, Colors.teal.shade300],
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 75,
                  width: paddedWidth,
                  child: InkWell(
                    onTap: () => eventLists[i].active
                        ? Get.toNamed('/view_event/${eventLists[i].id}')
                        : showDefaultDialog(
                            'Event is not available',
                            DialogType.info
                          ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white54,
                          child: Icon(
                            MaterialIcons.event_available,
                            size: 35,
                            color: Colors.teal,
                          ),
                        ),
                        Spacing.horizontalSpacing(30),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  eventLists[i].name.toUpperCase() ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: headline6,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacing.verticalSpacing(5),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.flag_outlined,
                                                color: Colors.teal,
                                                size: iconSize,
                                              ),
                                              Text(
                                                eventLists[i].category ?? '',
                                                style: subtitle3.copyWith(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        SizedBox(
                                          width: 150,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.teal,
                                                size: iconSize,
                                              ),
                                              Flexible(
                                                child: Text(
                                                    eventLists[i].place.isBlank
                                                        ? 'Location'
                                                        : eventLists[i].place,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: subtitle4),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacing.verticalSpacing(5),
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 71,
                                          child: Row(
                                            children: [
                                              Icon(
                                                FlutterIcons.activity_fea,
                                                color: Colors.teal,
                                                size: iconSize,
                                              ),
                                              Text(
                                                  eventLists[i].active
                                                      ? 'Active'
                                                      : 'Not Active',
                                                  style: subtitle4),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        SizedBox(
                                          width: 80,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.timelapse,
                                                color: Colors.teal,
                                                size: iconSize,
                                              ),
                                              Text(
                                                eventLists[i].date ??
                                                    'Event date',
                                                style: subtitle4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

Widget headerCard(double width, context) {
  final EventDetailsController _con = Get.find();
  var boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    color: Colors.white30,
  );
  return Container(
    width: width,
    height: 160,
    decoration: BoxDecoration(color: Colors.teal.shade300, boxShadow: [
      BoxShadow(
        blurRadius: 1,
        spreadRadius: 0.8,
        offset: Offset(0, 1),
        color: Colors.grey,
      )
    ]),
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                _con.eventDetails?.value?.name?.toUpperCase() ?? '',
                maxLines: 2,
                style: headline6.copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            IconButton(
              splashColor: Colors.white,
              icon: Obx(
                () => Icon(
                  _con.favorites.value != null &&
                          _con.favorites.value.eventIds
                              .contains(_con.eventDetails.value.id)
                      ? FlutterIcons.favorite_mdi
                      : FlutterIcons.favorite_border_mdi,
                  color: Colors.white,
                ),
              ),
              onPressed: () =>
                  _con.addEventTofavorite(_con.eventDetails.value.id),
            )
          ],
        ),
        Spacing.verticalSpacing(10.0),
        Container(
          width: width,
          padding: EdgeInsets.all(5.0),
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90,
                child: Row(
                  children: [
                    Icon(Icons.flag_outlined),
                    Spacing.horizontalSpacing(3),
                    Text(
                      _con.eventDetails?.value?.category ?? '',
                      style: subtitle3,
                    )
                  ],
                ),
              ),
              Container(
                width: 90,
                child: Row(
                  children: [
                    Icon(Icons.timelapse),
                    Spacing.horizontalSpacing(5),
                    Text(
                      _con.eventDetails?.value?.date ?? '',
                      style: subtitle3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Spacing.verticalSpacing(10.0),
        Container(
          width: width,
          padding: EdgeInsets.all(5.0),
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 250,
                child: Row(
                  children: [
                    Icon(Icons.location_city_rounded),
                    Spacing.horizontalSpacing(5),
                    Flexible(
                      child: Text(
                        _con.eventDetails.value?.place?.capitalize ?? '',
                        style: subtitle3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 90,
                child: Row(
                  children: [
                    Icon(
                      FlutterIcons.activity_fea,
                    ),
                    Spacing.horizontalSpacing(10),
                    Text(
                      _con.eventDetails.value.active ? "Active" : "Not Active",
                      style: subtitle3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget cirCularIcon({String imgPath}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
      ),
      Positioned(
        top: -80,
        left: 135,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 3.0,
                spreadRadius: 1.0,
                offset: Offset(1.0, 3.0),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            imgPath,
            height: 90,
            width: 105,
          ),
        ),
      ),
    ],
  );
}

// Shimmer Loader

Widget listShimmerLoading() {
  return Container(
    height: 200,
    width: width,
    child: Column(
      children: List.filled(2, 1)
          .map((e) => Shimmer.fromColors(
                baseColor: Colors.teal,
                highlightColor: Colors.tealAccent,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.grey,
                        offset: Offset(0, 1),
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp,
                      colors: [Colors.grey.shade200, Colors.teal.shade300],
                    ),
                  ),
                  height: 90,
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ))
          .toList(),
    ),
  );
}

Widget shimmeringloading() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    width: width,
    height: height,
    child: Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            margin: EdgeInsets.only(top: 5),
            width: 200,
            height: 200,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: .5,
                offset: Offset(0, 1),
                color: Colors.grey.shade500,
              )
            ]),
            child: ClipOval(
              child: SizedBox(
                width: 250.0,
                height: 250.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.teal,
                  highlightColor: Colors.tealAccent,
                  child: Container(
                    color: Colors.grey,
                    width: 200,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacing.verticalSpacing(5),
        Shimmer.fromColors(
          baseColor: Colors.teal,
          highlightColor: Colors.tealAccent,
          child: Container(
            width: width,
            height: 160,
            decoration: BoxDecoration(color: Colors.teal.shade300, boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 0.8,
                offset: Offset(0, 1),
                color: Colors.grey,
              )
            ]),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(),
          ),
        ),
        Spacing.verticalSpacing(10),
        Shimmer.fromColors(
          baseColor: Colors.white60,
          highlightColor: Colors.grey,
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: width,
            height: 150,
            color: Colors.grey,
            child: SizedBox(),
          ),
        ),
        Spacing.verticalSpacing(20),
        Shimmer.fromColors(
          baseColor: Colors.teal,
          highlightColor: Colors.tealAccent,
          child: SizedBox(
            width: width - 100,
            child: ElevatedButton(
              onPressed: () => {},
              child: Text(
                "Join Tournament",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}



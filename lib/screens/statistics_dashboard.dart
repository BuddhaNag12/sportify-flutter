import 'package:flutter/material.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/models/chartModel.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:sportify/screens/exports/joinEvtExports.dart';
import 'package:sportify/widgets/Widget_charts.dart';

class StatisticScreen extends StatelessWidget {
  final AuthController auth = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: Obx(
        () => auth.stateUser?.value?.uid != null
            ? StreamBuilder<QuerySnapshot>(
                stream: events
                    .where('user_id', isEqualTo: auth.stateUser?.value?.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<EventsList> eventLists = [];
                  snapshot.data.docs.forEach((QueryDocumentSnapshot element) {
                    eventLists.add(EventsList.fromFirestore(element.data()));
                  });
                  Map<String, int> totalCategories = {};
                  List<CategoriesModel> totalChartData = [];
                  var totalEvents = eventLists.length;
                  var categories = eventLists.map((e) => e.category).toList();
                  categories.forEach((i) => totalCategories['$i'] =
                      totalCategories.containsKey('$i')
                          ? totalCategories['$i'] + 1
                          : 1);
                  totalCategories.keys.forEach((element) {
                    totalChartData.add(CategoriesModel(
                        element,
                        totalCategories[element],
                        Colors.teal[totalCategories[element] * 100]));
                  });
                  return Container(
                    width: width,
                    height: height * 0.8,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Your Daily Statistics",
                            style: headline1,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 100,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Total Events"),
                                Center(
                                  child: Text(
                                    '$totalEvents',
                                  ),
                                ),
                              ],
                            ),
                            elevation: 5,
                            color: primaryColorLight,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: paddedWidth,
                              child: Card(
                                elevation: 4,
                                child: totalEvents == 0
                                    ? Center(
                                        child: SvgPicture.asset(
                                          'assets/notFound.svg',
                                          width: 250,
                                          height: 250,
                                        ),
                                      )
                                    : BarChart(
                                        data: totalChartData,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : Container(
                width: width,
                height: height * 0.7,
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
              ),
      ),
    );
  }
}

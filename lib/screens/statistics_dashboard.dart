import 'package:flutter/material.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/eventController.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/models/chartModel.dart';
import 'package:sportify/widgets/Widget_charts.dart';

class StatisticScreen extends StatelessWidget {
  StatisticScreen({Key key}) : super(key: key);
  // final StatisticController stat = Get.put(StatisticController());
  final EventController stat = Get.find();

  final List<CategoriesModel> data = [
   new CategoriesModel('cricket', 100),
      new CategoriesModel('football', 75),
      new CategoriesModel('basketball', 25),
      new CategoriesModel('chess', 5),
      new CategoriesModel('bollyboll', 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
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
                      Obx(
                        () => stat.isLoading.isTrue
                            ? CircularProgressIndicator()
                            : Center(
                                child: Text(
                                  '${stat.totalEvents}',
                                ),
                              ),
                      ),
                    ],
                  ),
                  elevation: 5,
                  color: primaryColorLight,
                ),
              ),
              SizedBox(
                height: 400,
                child: DonutPieChart(
                  data: data,
                )
              ),
              SizedBox(
                height: 400,
                child: BarChart(
                  data: data,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

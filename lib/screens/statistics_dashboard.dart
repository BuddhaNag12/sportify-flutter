import 'package:flutter/material.dart';
import 'package:sportify/constants/colorConst.dart';
import 'package:sportify/constants/responsiveConst.dart';
import 'package:sportify/constants/typographyConstants.dart';
import 'package:sportify/controllers/exports/event_exports.dart';
import 'package:sportify/controllers/statisticController.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/screens/exports/createEventExport.dart';
import 'package:sportify/screens/exports/joinEvtExports.dart';
import 'package:sportify/widgets/Widget_charts.dart';

class StatisticScreen extends StatelessWidget {
  StatisticScreen({Key key}) : super(key: key);
  final StatisticController stat = Get.put(StatisticController());
  final AuthController auth = Get.find();

  @override
  Widget build(BuildContext context) {
    stat.getMyEvents();
    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      body: Container(
        height: height,
        child: Obx(
          () => auth.stateUser.value?.uid == null
              ? Container(
                  width: width,
                  height: 200,
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
                      ),
                      Spacing.verticalSpacing(20)
                    ],
                  ),
                )
              : Column(
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
                    stat.isLoading.isFalse
                        ? Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: paddedWidth,
                                child: Card(
                                  elevation: 4,
                                  child: Obx(
                                    () => stat.totalEvents.value == 0
                                        ? Center(
                                            child: SvgPicture.asset(
                                              'assets/notFound.svg',
                                              width: 250,
                                              height: 250,
                                            ),
                                          )
                                        : BarChart(
                                            data: stat.totalChartData,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : CircularProgressIndicator(),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/widgets/localWidgets.dart';

class ViewEventScreen extends StatefulWidget {
  @override
  _ViewEventScreenState createState() => _ViewEventScreenState();
}

class _ViewEventScreenState extends State<ViewEventScreen>
    with TickerProviderStateMixin {
  TabController tabController;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(
        isTransparent: false,
      ),
      backgroundColor: Colors.tealAccent.shade700,
      body: Container(
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
                  child: ClipOval(
                    child: Image.asset('assets/map.png'),
                  )),
            ),
            spacer(5),
            headerCard(width, context),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text("Details".toUpperCase()),
                  ),
                  Tab(child: Text("Teams".toUpperCase())),
                ],
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: IndexedStack(
                children: <Widget>[
                  Visibility(
                    child: Container(
                      height: 120,
                      child: Text(
                        'about the tournament it is open tournament for any participants to join it and play the tournament,lorem ipsm i slorem ipsm islorem ipsm islorem ipsm is lorem ipsm is',
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ),
                    maintainState: true,
                    visible: selectedIndex == 0,
                  ),
                  Visibility(
                    child: Container(
                      height: 120,
                      child: Text(
                        'about the Team it is open tournament for any participants to join it and play the tournament,lorem ipsm i slorem ipsm islorem ipsm islorem ipsm is lorem ipsm is',
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ),
                    maintainState: true,
                    visible: selectedIndex == 1,
                  ),
                ],
                index: selectedIndex,
              ),
            ),
            SizedBox(
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
                  style: ButtonStyle(),
                ))
          ],
        ),
      ),
    );
  }
}

Widget headerCard(double width, context) {
  var boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    color: Colors.white30,
  );
  return Container(
    width: width,
    height: 160,
    decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.teal.shade300,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
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
        Text(
          "Jiri Youth open tournament long long long long longlonglonglonglong",
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        spacer(10.0),
        Container(
            width: width,
            padding: EdgeInsets.all(5.0),
            decoration: boxDecoration,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Icon(Icons.flag_outlined), Text("Cricket")],
                      )),
                  Container(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Icon(Icons.timelapse), Text("12-12-2021")],
                      ))
                ])),
        spacer(10.0),
        Container(
          padding: EdgeInsets.all(5.0),
          width: width,
          decoration: boxDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on_rounded),
                      Text("Location")
                    ],
                  )),
              Container(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(FlutterIcons.activity_fea), Text("Active")],
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

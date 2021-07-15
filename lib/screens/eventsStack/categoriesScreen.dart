import 'package:flutter/material.dart';
// import 'package:sportify/global_widgets/appbar.dart';
import 'package:sportify/screens/exports/eventExport.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                'https://images.unsplash.com/photo-1505250469679-203ad9ced0cb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
              title: Text(
                'Sportify',
                style: headline3,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10.0,
              childAspectRatio: 5.0,
              mainAxisExtent: 150,
            ),
            delegate: SliverChildListDelegate.fixed(
              [
                ...sliverGridListItems.map(
                  (e) => Container(
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () => Get.toNamed(e.route),
                      child: Material(
                        elevation: 1,
                        child: Stack(
                          children: [
                            Container(
                              child: Positioned.fill(
                                child: Image.network(
                                  e.backgroudImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              bottom: 50,
                              left: 50,
                              right: 50,
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: .8,
                                    color: Colors.tealAccent.withOpacity(0.4),
                                    offset: Offset(1.5, 1),
                                  )
                                ]),
                                child: Center(
                                  child: Text(
                                    e.title,
                                    style:
                                        headline2.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

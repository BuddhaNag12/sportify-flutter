import 'package:flutter/material.dart';
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
                style: headline3.copyWith(color: Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5,
            ),
            delegate: SliverChildListDelegate.fixed(
              [
                ...sliverGridListItems.map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(e.route),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: ClipOval(
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      primaryColorLight,
                                      primaryColorDark
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade800,
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(1.0, 5.0),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    e.title,
                                    style: subtitle2.copyWith(
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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

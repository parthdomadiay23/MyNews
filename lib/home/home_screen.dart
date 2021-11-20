// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sized_box_for_whitespace, avoid_function_literals_in_foreach_calls, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodt/controller/list_ctrl.dart';
import 'package:prodt/web/web_view_screen.dart';
import 'package:swipe_to/swipe_to.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> lstCategory = [];

  NewsController ctrl = Get.put(NewsController());

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 12; i++) {
      Category objCategory = new Category();
      objCategory.isSelect = false;

      if (i == 0) {
        objCategory.isSelect = true;
        objCategory.name = "All";
        objCategory.id = 0;
      }
      if (i == 1) {
        objCategory.name = "National";
        objCategory.id = 1;
      }
      if (i == 2) {
        objCategory.name = "Business";
        objCategory.id = 2;
      }
      if (i == 3) {
        objCategory.name = "Sports";
        objCategory.id = 3;
      }
      if (i == 4) {
        objCategory.name = "World";
        objCategory.id = 4;
      }
      if (i == 5) {
        objCategory.name = "Politics";
        objCategory.id = 5;
      }
      if (i == 6) {
        objCategory.name = "Technology";
        objCategory.id = 6;
      }
      if (i == 7) {
        objCategory.name = "Startup";
        objCategory.id = 7;
      }
      if (i == 8) {
        objCategory.name = "Entertainment";
        objCategory.id = 8;
      }
      if (i == 9) {
        objCategory.name = "Miscellaneous";
        objCategory.id = 9;
      }
      if (i == 10) {
        objCategory.name = "Hatke";
        objCategory.id = 10;
      }
      if (i == 11) {
        objCategory.name = "Science";
        objCategory.id = 11;
      }
      if (i == 12) {
        objCategory.name = "Automobile";
        objCategory.id = 12;
      }
      lstCategory.add(objCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'DashBoard',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Theme.of(context).backgroundColor,
                fontSize: 24,
              ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 4,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 14, left: 14, top: 14, bottom: 8),
          //   child: Text(
          //     'CATEGORIES',
          //     style: Theme.of(context).textTheme.headline4!.copyWith(
          //           color: Theme.of(context).primaryColor,
          //           fontSize: 20,
          //         ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: Container(
              height: 60,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemCount: lstCategory.length,
                itemBuilder: (buildcontext, i) {
                  return Row(
                    children: [
                      Container(
                        decoration: lstCategory[i].isSelect == true
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Theme.of(context).primaryColor,
                                border: Border.all(color: Theme.of(context).primaryColor),
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Theme.of(context).backgroundColor,
                                border: Border.all(color: Theme.of(context).primaryColor),
                              ),
                        child: InkWell(
                          onTap: () {
                            lstCategory.forEach((element) {
                              if (element.id == i) {
                                element.isSelect = true;
                              } else {
                                element.isSelect = false;
                              }
                            });
                            setState(() {});
                            ctrl.lstMovie.clear();
                            ctrl.fetchData(category: lstCategory[i].name!.toLowerCase());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 18, right: 18),
                            child: Text(
                              lstCategory[i].name ?? "",
                              style: Theme.of(context).textTheme.headline4!.copyWith(
                                    color: lstCategory[i].isSelect == true ? Theme.of(context).backgroundColor : Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: lstCategory[i].isSelect == true ? FontWeight.bold : FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: GetX<NewsController>(
              builder: (contlr) {
                return PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (var i = 0; i < contlr.lstMovie.length; i++)
                      SwipeTo(
                        iconOnLeftSwipe: Icons.arrow_forward_ios_outlined,
                        animationDuration: Duration(milliseconds: 150),
                        onLeftSwipe: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                webLink: contlr.lstMovie[i].readMoreUrl,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    contlr.lstMovie[i].imageUrl.toString(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                              child: Text(
                                contlr.lstMovie[i].title ?? "",
                                style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                contlr.lstMovie[i].content ?? "",
                                style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewScreen(
                                      webLink: contlr.lstMovie[i].readMoreUrl,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                color: Theme.of(context).primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            contlr.lstMovie[i].author.toString(),
                                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                          ),
                                          Text(
                                            "tap to know more",
                                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ],
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Category {
  int? id;
  String? name;
  bool? isSelect;

  Category({
    this.name,
    this.id,
    this.isSelect,
  });
}

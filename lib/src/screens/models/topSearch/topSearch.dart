import 'package:flutter/material.dart';
import 'package:gugu/src/gateway/categories.dart';
import 'package:gugu/src/utils/animations/shimmers/available_courses.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:gugu/src/widgets/app_listview_builder.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:gugu/src/widgets/star_widget.dart';

class topSearch extends StatefulWidget {
  const topSearch({super.key});

  @override
  State<topSearch> createState() => _topSearchState();
}

class _topSearchState extends State<topSearch> {
  List data = [];

  void fetchData() async {
    hairDressers CategoriesServices = hairDressers();
    final datas = await CategoriesServices.getStyles(context);
    setState(() {
      data = datas['contents'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                AppText(
                  txt: 'Top Search',
                  size: 15,
                  color: AppConst.black,
                  weight: FontWeight.w700,
                ),
                Spacer(),
                AppText(
                  txt: 'View All',
                  size: 15,
                  color: AppConst.black,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConst.black,
                )
              ],
            ),
          ),
          data.isEmpty
              ? Expanded(
                  child: AppListviewBuilder(
                      direction: Axis.horizontal,
                      itemnumber: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return availableCoursesShimmerLoad(
                          width: 200,
                          height: 200,
                          borderRadius: 15,
                        );
                      }))
              : Expanded(
                  child: AppListviewBuilder(
                      direction: Axis.horizontal,
                      itemnumber: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, RouteNames.getContentsById,
                                arguments: {
                                  'content_id': data[index]['id'],
                                  'title': data[index]['title']
                                }),
                            child: Stack(
                              children: [
                                // ColorFiltered(
                                //   colorFilter: ColorFilter.mode(
                                //     Colors.black.withOpacity(0.6),
                                //     BlendMode.srcOver,
                                //   ),
                                //   child: Image.network(
                                //     '${dotenv.env['IMAGE_SERVER']}${data[index]['image']}',
                                //   ),
                                // ),
                                Positioned(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: 380,
                                          child: AppText(
                                            txt: data[index]['title'],
                                            color: Colors.white,
                                            weight: FontWeight.w700,
                                            size: 20,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          StarRating(
                                              numberOfStars: data[index]['star']
                                                  .toString()),
                                          AppText(
                                            txt: '(' +
                                                data[index]['readers']
                                                    .toString() +
                                                ')',
                                            size: 18,
                                            weight: FontWeight.w700,
                                            color: AppConst.white,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
        ],
      ),
    );
  }
}

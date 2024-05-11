import 'package:flutter/material.dart';
import 'package:gugu/src/functions/moneyFormatter.dart';
import 'package:gugu/src/gateway/categories.dart';
import 'package:gugu/src/utils/animations/shimmers/available_courses.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:gugu/src/widgets/app_text.dart';

class availableCourses extends StatefulWidget {
  const availableCourses({Key? key}) : super(key: key);

  @override
  State<availableCourses> createState() => _availableCoursesState();
}

class _availableCoursesState extends State<availableCourses> {
  List data = [];

  void fetchData() async {
    hairDressers HairDresserServices = hairDressers();
    final datas = await HairDresserServices.getStyles(context);
    setState(() {
      data = datas['hairStyle'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? availableCoursesShimmerLoad(
            width: 400,
            height: 200,
            borderRadius: 15,
          )
        : SizedBox(
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteNames.getContentsById,
                      arguments: {
                        'styleId': data[index]['id'],
                        'name': data[index]['name'],
                        'amount': data[index]['amount'],
                      },
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppConst.primary,
                            AppConst.red,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: data[index]['name'],
                            size: 18,
                            color: AppConst.white,
                          ),
                          FutureBuilder<String>(
                            future: formatPrice(
                                data[index]['amount'] ?? '50000', 'Tzs'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return CircularProgressIndicator();
                              } else {
                                return AppText(
                                  txt: snapshot.data ?? '',
                                  color: Colors.white,
                                  weight: FontWeight.w700,
                                  size: 16,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}

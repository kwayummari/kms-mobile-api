// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gugu/src/functions/moneyFormatter.dart';
import 'package:gugu/src/gateway/content-by-category-id.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/utils/routes/route-names.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_listview_builder.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:gugu/src/widgets/star_widget.dart';

class contentsByCategoryId extends StatefulWidget {
  var id;
  var title;

  contentsByCategoryId({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<contentsByCategoryId> createState() => _contentsByCategoryIdState();
}

class _contentsByCategoryIdState extends State<contentsByCategoryId> {
  List data = [];

  void fetchData() async {
    contentsByCategoriesServices ContentsServices =
        contentsByCategoriesServices();
    final datas = await ContentsServices.getContents(context, widget.id);
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
    return AppBaseScreen(
      appBar: AppBar(
        title: AppText(
          txt: widget.title,
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      child: data.isEmpty
          ? CircularProgressIndicator()
          : AppListviewBuilder(
              itemnumber: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, RouteNames.getContentsById, arguments: {
                      'content_id': data[index]['id'],
                      'title': data[index]['title']
                    }),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.srcOver,
                          ),
                          child: Image.network(
                            '${dotenv.env['IMAGE_SERVER']}${data[index]['image']}',
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          top: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 380,
                                  child: AppText(
                                    txt: data[index]['title'],
                                    color: Colors.white,
                                    weight: FontWeight.w700,
                                    size: 25,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  StarRating(
                                      numberOfStars:
                                          data[index]['star'].toString()),
                                  AppText(
                                    txt: '(' +
                                        data[index]['readers'].toString() +
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
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: FutureBuilder<String>(
                            future: formatPrice(data[index]['price'], 'Tzs'),
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
                                  size: 20,
                                  softWrap: true,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}

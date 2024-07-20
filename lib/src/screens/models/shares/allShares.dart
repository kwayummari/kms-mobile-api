import 'package:flutter/material.dart';
import 'package:kms/src/gateway/loan-services.dart';
import 'package:kms/src/gateway/shares-services.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_listview_builder.dart';
import 'package:kms/src/widgets/app_text.dart';

class AllShares extends StatefulWidget {
  const AllShares({super.key});

  @override
  State<AllShares> createState() => _AllSharesState();
}

class _AllSharesState extends State<AllShares> {
  void initState() {
    getMenu();
    super.initState();
  }

  List data = [];
  void getMenu() async {
    sharesService shareService = sharesService();
    var companyId = '1';
    final datas = await shareService.shares(context, companyId);
    setState(() {
      data = datas['shares'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        title: AppText(
          txt: 'List of shares',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        isFlexible: false,
        showAppBar: true,
        bgcolor: AppConst.white,
        appBarBgColor: AppConst.white,
        iconColor: AppConst.black,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            AppListviewBuilder(
                itemnumber: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: ExpansionTile(
                      leading: Icon(
                        Icons.local_atm_rounded,
                        color: AppConst.primary,
                      ),
                      title: AppText(
                        txt: data[index]['fullname'] + ' shares',
                        size: 15,
                        color: AppConst.primary,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Shares',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['number'],
                                size: 15,
                                color: AppConst.black,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Amount',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['amount'],
                                size: 15,
                                color: AppConst.black,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Row(
                            children: [
                              AppText(
                                txt: 'Date',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['date'],
                                size: 15,
                                color: AppConst.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ));
  }
}

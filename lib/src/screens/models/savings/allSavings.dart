import 'package:flutter/material.dart';
import 'package:kms/src/gateway/savings-services.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_listview_builder.dart';
import 'package:kms/src/widgets/app_text.dart';

class AllSavings extends StatefulWidget {
  const AllSavings({super.key});

  @override
  State<AllSavings> createState() => _AllSavingsState();
}

class _AllSavingsState extends State<AllSavings> {
  void initState() {
    getMenu();
    super.initState();
  }

  List data = [];
  void getMenu() async {
    savingsService savingService = savingsService();
    var companyId = '1';
    final datas = await savingService.savings(context, companyId);
    setState(() {
      data = datas['savings'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        title: AppText(
          txt: 'List of savings',
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
                        txt: data[index]['name'],
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
                                txt: 'Payment Reference',
                                size: 15,
                                color: AppConst.black,
                                weight: FontWeight.bold,
                              ),
                              Spacer(),
                              AppText(
                                txt: data[index]['paymentReference'],
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

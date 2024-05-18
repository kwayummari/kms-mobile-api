import 'package:flutter/material.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_button.dart';
import 'package:kms/src/widgets/app_container.dart';
import 'package:kms/src/widgets/app_listview_builder.dart';
import 'package:kms/src/widgets/app_material.dart';
import 'package:kms/src/widgets/app_text.dart';

class SharesCard extends StatefulWidget {
  const SharesCard({super.key});

  @override
  State<SharesCard> createState() => _SharesCardState();
}

class _SharesCardState extends State<SharesCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppMaterial(
              color: AppConst.grey400,
              elevation: 5,
              radius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AppMaterial(
                  color: AppConst.grey300,
                  elevation: 20,
                  radius: BorderRadius.circular(10),
                  child: AppContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Wrap(
                            children: [
                              AppButton(
                                  onPress: () {},
                                  label: '+ Deposit',
                                  borderRadius: 0,
                                  textColor: AppConst.whiteOpacity,
                                  bcolor: AppConst.primary),
                              AppButton(
                                  onPress: () {},
                                  label: '- Withdraw',
                                  borderRadius: 0,
                                  textColor: AppConst.black,
                                  bcolor: AppConst.grey400)
                            ],
                          ),
                          trailing: Icon(Icons.open_in_full_outlined),
                        )
                      ],
                    ),
                    bottom: 10,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              )),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: AppListviewBuilder(
                  itemnumber: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return AppMaterial(
                        color: AppConst.grey400,
                        elevation: 5,
                        radius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: AppMaterial(
                            color: AppConst.grey300,
                            elevation: 20,
                            radius: BorderRadius.circular(10),
                            child: AppContainer(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 15,
                                        bottom: 5),
                                    child: Row(
                                      children: [
                                        AppText(
                                          txt: 'Date Purchased',
                                          size: 15,
                                          color: AppConst.black,
                                        ),
                                        Spacer(),
                                        AppText(
                                          txt: 'May 11, 2024',
                                          size: 15,
                                          color: AppConst.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 5),
                                    child: Row(
                                      children: [
                                        AppText(
                                          txt: 'Payment method',
                                          size: 15,
                                          color: AppConst.black,
                                        ),
                                        Spacer(),
                                        AppText(
                                          txt: 'Bank/Bank Wakala',
                                          size: 15,
                                          color: AppConst.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 5),
                                    child: Row(
                                      children: [
                                        AppText(
                                          txt: 'Amount',
                                          size: 15,
                                          color: AppConst.black,
                                        ),
                                        Spacer(),
                                        AppText(
                                          txt: '1,000,000',
                                          size: 15,
                                          color: AppConst.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: AppConst.blackOpacity,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppButton(
                                        onPress: () {},
                                        label: 'Verified',
                                        borderRadius: 20,
                                        textColor: AppConst.whiteOpacity,
                                        bcolor: AppConst.green),
                                  ),
                                ],
                              ),
                              bottom: 10,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ));
                  }),
            )),
        SizedBox(
          height: 60,
        )
      ],
    );
  }
}

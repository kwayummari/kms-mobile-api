import 'package:flutter/material.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_button.dart';
import 'package:kms/src/widgets/app_container.dart';
import 'package:kms/src/widgets/app_material.dart';
import 'package:kms/src/widgets/app_text.dart';

class SavingsCard extends StatefulWidget {
  const SavingsCard({super.key});

  @override
  State<SavingsCard> createState() => _SavingsCardState();
}

class _SavingsCardState extends State<SavingsCard> {
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
                      children: [
                        ListTile(
                          leading: Icon(Icons.security),
                          trailing: Icon(Icons.arrow_circle_down_sharp),
                          title: AppText(
                            txt: 'Guarantee Request',
                            size: 20,
                            color: AppConst.black,
                            weight: FontWeight.w600,
                          ),
                          subtitle: AppText(
                            txt: '0 request',
                            size: 15,
                            color: AppConst.black,
                            weight: FontWeight.w400,
                          ),
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
        )
      ],
    );
  }
}

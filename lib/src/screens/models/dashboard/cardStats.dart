import 'package:flutter/material.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_container.dart';
import 'package:kms/src/widgets/app_material.dart';
import 'package:kms/src/widgets/app_text.dart';

class CardsStatus extends StatefulWidget {
  const CardsStatus({super.key});

  @override
  State<CardsStatus> createState() => _CardsStatusState();
}

class _CardsStatusState extends State<CardsStatus> {
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
                      children: [
                        ListTile(
                          leading: Icon(Icons.card_travel_outlined),
                          trailing: Icon(Icons.arrow_circle_down_sharp),
                          title: AppText(
                            txt: 'Next Repayment',
                            size: 20,
                            color: AppConst.black,
                            weight: FontWeight.w600,
                          ),
                          subtitle: AppText(
                            txt: '1,357,558.03',
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

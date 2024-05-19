import 'package:flutter/material.dart';
import 'package:kms/src/utils/app_const.dart';
import 'package:kms/src/widgets/app_base_screen.dart';
import 'package:kms/src/widgets/app_base_stepper.dart';
import 'package:kms/src/widgets/app_text.dart';

class LoanApplication extends StatefulWidget {
  const LoanApplication({super.key});

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  int _currentStep = 0;

  void _nextStep(int currentStep) {
    if (currentStep < steps.length - 1) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _previousStep(int currentStep) {
    if (currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _stepTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  final List<Step> steps = [
    Step(
      title: AppText(
        txt: 'Product',
        size: 15,
        color: AppConst.black,
      ),
      content: Text('Content for Step 1'),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('Content for Step 2'),
      isActive: true,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Content for Step 3'),
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      title: AppText(
        txt: 'Settings',
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
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: AppStepper(
          currentStep: _currentStep,
          steps: steps,
          onStepContinue: _nextStep,
          onStepCancel: _previousStep,
          onStepTapped: _stepTapped,
        ),
      ),
    );
  }
}

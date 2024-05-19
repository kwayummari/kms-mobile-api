import 'package:flutter/material.dart';

class AppStepper extends StatelessWidget {
  final int currentStep;
  final List<Step> steps;
  final Function(int) onStepContinue;
  final Function(int) onStepCancel;
  final Function(int) onStepTapped;

  const AppStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
    required this.onStepContinue,
    required this.onStepCancel,
    required this.onStepTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: currentStep,
      onStepContinue: () => onStepContinue(currentStep),
      onStepCancel: () => onStepCancel(currentStep),
      onStepTapped: (step) => onStepTapped(step),
      steps: steps,
    );
  }
}

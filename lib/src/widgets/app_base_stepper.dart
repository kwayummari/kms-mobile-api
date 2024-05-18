import 'package:flutter/material.dart';

class AppStepper extends StatefulWidget {
  final List<StepData> steps;
  final Color activeColor;
  final Color inactiveColor;
  final double stepSize;

  const AppStepper({
    Key? key,
    required this.steps,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.stepSize = 24.0,
  }) : super(key: key);

  @override
  _AppStepperState createState() => _AppStepperState();
}

class _AppStepperState extends State<AppStepper> {
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < widget.steps.length - 1) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.steps.map((step) {
            int stepIndex = widget.steps.indexOf(step);
            return Column(
              children: [
                CircleAvatar(
                  radius: widget.stepSize,
                  backgroundColor: stepIndex == _currentStep
                      ? widget.activeColor
                      : widget.inactiveColor,
                  child: Text(
                    '${stepIndex + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  step.title,
                  style: TextStyle(
                    color: stepIndex == _currentStep
                        ? widget.activeColor
                        : widget.inactiveColor,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            child: widget.steps[_currentStep].content,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _previousStep,
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: _nextStep,
              child: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}

class StepData {
  final String title;
  final Widget content;

  StepData({required this.title, required this.content});
}
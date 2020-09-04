import 'package:flutter/material.dart';

import 'screen_size_config.dart';

class StepperDefaultExt extends StatefulWidget {
  StepperDefaultExt({Key key}) : super(key: key);

  @override
  _StepperDefaultExtState createState() => _StepperDefaultExtState();
}

class _StepperDefaultExtState extends State<StepperDefaultExt> {
  int _currentStep = 0;
  ScreenSizeConfig _screenSizeConfig = ScreenSizeConfig();
  final StepperType stepperType = StepperType.horizontal; //.vertical;
  int _maxSteps;

  @override
  Widget build(BuildContext context) {
    // NB! this must be initialized inside build!
    _screenSizeConfig.init(context);

    List<Step> _steps = _buildSteps();
    _maxSteps = _steps.length;

    return Container(
      child: Stepper(
        type: stepperType,
        currentStep: _currentStep,
        onStepTapped: (int step) => setState(() => _currentStep = step),
        onStepContinue: _currentStep + 1 < _maxSteps
            ? () => setState(() => _currentStep++)
            : null,
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep = 0) : null,
        steps: _steps,
      ),
    );
  }

  // define all the steps
  _buildSteps() {
    return [
      new Step(
        title: Text('Display'),
        content: _screenAwareContainer(
          child: SingleChildScrollView(
            child: Text(
              'This is the 1st step.\n' + _longText,
              style: TextStyle(fontSize: 16),
              maxLines: 44,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      ),
      new Step(
        title: Text('Payment'),
        content: _screenAwareContainer(
          child: SingleChildScrollView(
            child: Text(
              'This is the 2nd step.\n' + _longText,
              style: TextStyle(fontSize: 16),
              maxLines: 44,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      new Step(
        title: Text('Order'),
        content: _screenAwareContainer(
          child: SingleChildScrollView(
            child: Text(
              'This is the 3rd step.\n' + _longText,
              style: TextStyle(fontSize: 16),
              maxLines: 44,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
    ];
  }

  // a handy method to wrap a widget with a 'screen-aware' Container
  Widget _screenAwareContainer({@required Widget child, double height}) {
    double _stepContainerHeight = (stepperType == StepperType.horizontal
        ? _screenSizeConfig.safeBlockVertical * 62
        : _screenSizeConfig.safeBlockHorizontal * 88);
    return Container(
      height: height ?? _stepContainerHeight,
      child: child,
    );
  }

  String _longText = '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text';
}

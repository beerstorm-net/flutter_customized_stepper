import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'screen_size_config.dart';

class StepperCustomImpl extends StatefulWidget {
  StepperCustomImpl({Key key}) : super(key: key);

  @override
  _StepperCustomImplState createState() => _StepperCustomImplState();
}

class _StepperCustomImplState extends State<StepperCustomImpl> {
  ScreenSizeConfig _screenSizeConfig = ScreenSizeConfig();
  List<Widget> _mySteps = List();
  double _currentStep = 0;

  @override
  void initState() {
    _buildSteps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSizeConfig.init(context);

    return Stack(
      children: [
        // body
        Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 64.0, bottom: 64.0),
            child: _screenAwareContainer(child: _mySteps[_currentStep.toInt()]),
          ),
        ),

        // header
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 8.0),
            child: _myDotsStepper(),
          ),
        ),

        // footer
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(bottom: 16.0),
            child: _footerButtons(),
          ),
        ),
      ],
    );
  }

  _buildSteps() {
    int max = 8;
    for (int i = 0; i < max; i++) {
      _mySteps.add(_buildStep(i));
    }
  }

  _buildStep(index) {
    // NB! this step can be replaced by any widget you want!
    return SingleChildScrollView(
        child: Container(
            child: Text(
      'This is the step.${index + 1}\n' + _longText,
      style: TextStyle(fontSize: 16),
      maxLines: 60,
      overflow: TextOverflow.fade,
    )));
  }

  _myDotsStepper() {
    return DotsIndicator(
      dotsCount: _mySteps.length, //_dotsCount,
      axis: Axis.horizontal,
      position: _currentStep,
      onTap: (position) {
        setState(() => _currentStep = position);
      },
      decorator: DotsDecorator(
        size: const Size.square(22.0),
        activeSize: const Size(44.0, 22.0),
        activeColor: Colors.blueGrey,
        color: Colors.lightBlueAccent,
        spacing: const EdgeInsets.symmetric(horizontal: 2.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  _footerButtons() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: _currentStep > 0,
            child: IconButton(
                icon: Icon(
                  Icons.skip_previous,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    _currentStep = 0;
                  });
                }),
          ),
          Visibility(
            visible: _currentStep > 0,
            child: IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  if (_currentStep > 0) {
                    setState(() {
                      _currentStep--;
                    });
                  }
                }),
          ),
          Container(
            child: Text(
              '${_currentStep.toInt() + 1}',
              style: TextStyle(fontSize: 26, color: Colors.blueGrey),
            ),
          ),
          Visibility(
            visible: _currentStep + 1 < _mySteps.length,
            child: IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  if (_currentStep + 1 < _mySteps.length) {
                    setState(() {
                      _currentStep++;
                    });
                  }
                }),
          ),
          Visibility(
            visible: _currentStep + 1 < _mySteps.length,
            child: IconButton(
                icon: Icon(
                  Icons.skip_next,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    _currentStep = _mySteps.length.toDouble() - 1;
                  });
                }),
          ),
        ],
      ),
    );
  }

  // a handy method to wrap a widget with a 'screen-aware' Container
  Widget _screenAwareContainer({@required Widget child, double height}) {
    double _stepContainerHeight = _screenSizeConfig.safeBlockVertical * 88;
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
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text' +
      '\n a very long text  a very long text  a very long text';
}

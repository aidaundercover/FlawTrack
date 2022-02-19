import 'package:flawtrack/const.dart';
import 'package:flutter/material.dart';

class StepperW extends StatefulWidget {
  const StepperW({Key? key,}) : super(key: key);

  @override
  _StepperWState createState() => _StepperWState();
}

class _StepperWState extends State<StepperW> {
  @override
  Widget build(BuildContext context) {
    int _index = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
           'Как закреплять проблемы на карте?',
          style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Container(
        child: Theme(
          data: Theme.of(context)
              .copyWith(colorScheme: ColorScheme.light(primary: primaryColor)),
          child: Stepper(
            currentStep: _index,
            onStepCancel: () {
              if (_index != 0) {
                setState(() {
                  _index--;
                });
              }
            },
            onStepContinue: () {
              if (_index != 2) {
                setState(() {
                  _index++;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            type: StepperType.horizontal,
            steps: [
              Step(
                isActive: _index >= 0,
                title: Text('Step 1 title'),
                content: Text('Content for Step 1'),
              ),
              Step(
                isActive: _index >= 1,
                title: Text('Step 2 title'),
                content: Text('Content for Step 2'),
              ),
              Step(
                isActive: _index >= 2,
                title: const Text('Step 1 title'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 1')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

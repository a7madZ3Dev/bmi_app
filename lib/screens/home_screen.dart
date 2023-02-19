import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';
import '../constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final heightEditingController = TextEditingController();
  final widthEditingController = TextEditingController();
  double? _bmiValue;
  String? _message;
  double? _height;
  double? _weight;

  String calculateBMI() {
    if (_height != null && _weight != null) {
      if (_height! <= 0 || _weight! <= 0) {
        setState(() {
          _message = 'Invalid Input 😵';
        });
      } else {
        setState(() {
          _bmiValue = _weight! / pow(_height! / 100, 2);
          _message = getResult();
        });
      }
    }
    return '';
  }

  void resetResult() {
    setState(() {
      _bmiValue = null;
      _message = null;
      heightEditingController.clear();
      widthEditingController.clear();
    });
  }

  String getResult() {
    if (_bmiValue! >= 25) {
      return 'You\'re Over Weight';
    } else if (_bmiValue! > 18.5) {
      return 'You\'re Normal';
    } else {
      return 'You\'re Under Weight';
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: _screenHeight * 0.07,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Spacer(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: accentHexColor)),
                  child: TextField(
                    controller: heightEditingController,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontSize: 20,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _height = double.tryParse(value);
                    },
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: accentHexColor)),
                  child: TextField(
                    controller: widthEditingController,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontSize: 20,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _weight = double.tryParse(value);
                    },
                    onSubmitted: (_) => calculateBMI(),
                  ),
                ),
              ),
              const Spacer(),
            ]),
            SizedBox(
              height: _screenHeight * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: orientation == Orientation.portrait
                      ? _screenWidth * 0.33
                      : _screenHeight * 0.33,
                  child: ElevatedButton(
                      onPressed: resetResult,
                      child: Text(
                        'Reset',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: accentHexColor,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: orientation == Orientation.portrait
                      ? _screenWidth * 0.33
                      : _screenHeight * 0.33,
                  child: ElevatedButton(
                      onPressed: calculateBMI,
                      child: Text(
                        'Calculate',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: accentHexColor,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: _screenHeight * 0.07,
            ),
            Text(
              _bmiValue?.toStringAsFixed(2) ?? '0',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: accentHexColor),
            ),
            SizedBox(
              height: _screenHeight * 0.07,
            ),
            Text(
              _message ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: accentHexColor),
            ),
            SizedBox(height: _screenHeight * 0.07),
            const LeftBar(barWidth: 40),
            SizedBox(height: _screenHeight * 0.02),
            const LeftBar(barWidth: 75),
            SizedBox(height: _screenHeight * 0.02),
            const LeftBar(barWidth: 35),
            SizedBox(height: _screenHeight * 0.02),
            const RightBar(barWidth: 55),
            SizedBox(height: _screenHeight * 0.04),
            const RightBar(barWidth: 32),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:  Column(
        children: <Widget> [
          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                  col: selectedGender == Gender.male
                  ? kActiveCardColor
                  : kInactiveCardColor,
                  cardChild: IconContent(FontAwesomeIcons.mars,
                      'MALE')
                  ),
                ),
              Expanded(child: ReusableCard(
                onPress:() {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                  col: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(FontAwesomeIcons.venus,
                      'FEMALE')),
              ),
            ],
          )),
          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(col: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text('HEIGHT',
                  style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget> [
                      Text(
                        height.toString(),
                      style: kLabelNumberStyle,
                      ),
                      Text('cm',
                      style: kLabelTextStyle,
                      ),
                    ],
                  ),

                   SliderTheme(
                     data: SliderTheme.of(context).copyWith(
                       inactiveTickMarkColor: Color(0xFF8D8E98),
                       activeTickMarkColor: Colors.white,
                       thumbColor: Color(0xFFEB1555),
                       overlayColor: Color(0x29EB1555),
                       thumbShape: RoundSliderThumbShape(
                         enabledThumbRadius: 15.0
                       ),
                       overlayShape: RoundSliderOverlayShape(
                         overlayRadius: 30.0
                       ),
                     ),
                     child: Slider(
                         value: height.toDouble(),
                         min: 150.0,
                         max: 200.0,
                         onChanged: (double newValue){
                           setState(() {
                             height = newValue.round();
                           });
                         },
                     ),
                   ),
                ],
              ),
              ),
              ),
            ],
          ),
          ),

          Expanded(child: Row(
            children: <Widget> [
              Expanded(child: ReusableCard(col:kActiveCardColor),
              ),
              Expanded(child: ReusableCard(col: kActiveCardColor),
              ),
            ],
          ),
          ),
          Container(color: kBottomBarColor,
          margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///G:/chinmay/login_flutterapp/lib/Pages/calculator_brain.dart';
import 'file:///G:/chinmay/login_flutterapp/lib/Pages/constants.dart';
import 'file:///G:/chinmay/login_flutterapp/lib/Pages/results_page.dart';


enum Gender {
  male,
  female,
}

class View_page extends StatefulWidget {
  @override
  _View_pageState createState() => _View_pageState();
}

class _View_pageState extends State<View_page> {

  Gender selectedGender;
  int height = 140;
  int weight = 10;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculate",
        ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
          children: <Widget>[
              Expanded(
                child:ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.male,label: "MALE"),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                  child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.female,label: "FEMALE"),
                  ),
              ),
          ],
          ),
            ),
          ),
   SizedBox(height: 5),
          Expanded(
            child:ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT", style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,

                    children: <Widget>[
                      Text(height.toString(),
                          style: numberTextStyle),
                      Text("cm",style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFF00FFCD),
                      overlayColor: Color(0x2900FFCD),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
                color: activeCardColor
            ),
          ),
          SizedBox(height: 5),

          Expanded(child:Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Weight", style: labelTextStyle),
                        Text(weight.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPress: (){
                                  setState(() {
                                  weight--;
                                });
                              },

                                icon: FontAwesomeIcons.minus,
                            ),

                            SizedBox(width: 10),

                            RoundIconButton(
                                onPress: (){
                                    setState(() {
                                      weight++;
                                  });
                                },

                                icon: FontAwesomeIcons.plus,
                            ),

                          ],
                        ),
                      ],
                    ),
                    color: activeCardColor),
                ),
                SizedBox(width: 5),

                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Age", style: labelTextStyle),
                          Text(age.toString(), style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              RoundIconButton(
                                  onPress: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                              ),

                              SizedBox(width: 10),

                              RoundIconButton(
                                  onPress: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                              ),

                            ],
                          ),
                        ],
                      ),
                    color: activeCardColor),
                ),
              ],
            ),
          ),
          ),
          BottomButton(buttonTitle: "CALCULATE",onTap: (){

            CalCulatorBrain calculate = CalCulatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calculate.calculateBMI(),
              resultText: calculate.getresult(),
              Interpretation: calculate.getInterpretation(),
            )));
          },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColor,
        child: Center(
          child: Text(buttonTitle,
            style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 60,
      ),
    );
  }
}


class IconContent extends StatelessWidget {
  IconContent ({this.icon, this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,color: Colors.white,
        ),
        SizedBox(height: 15),
        Text(label,
          style:labelTextStyle,
        ),
      ],
    );
  }
}


class ReusableCard extends StatelessWidget {

  ReusableCard ({@required this.color, this.cardChild, this.onPress});
  final Color color;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}






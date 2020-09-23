import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///G:/chinmay/login_flutterapp/lib/Pages/constants.dart';
import 'file:///G:/chinmay/login_flutterapp/lib/Pages/view_page.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.Interpretation});

  final String bmiResult;
  final String resultText;
  final String Interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReusableCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText.toUpperCase(),style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text(bmiResult,style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                    Text(
                      Interpretation,textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          BottomButton(
            buttonTitle: "Re-Calculate",
            onTap: (){
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}

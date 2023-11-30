import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/roundIconButton_widget.dart';
import '../components/bottom_container.dart';
import 'package:bmi/components/calculator_brain.dart';
import 'package:bmi/models/history.dart';
import 'package:bmi/screens/history_screen.dart';
import 'package:bmi/models/preference_services.dart';
import 'package:intl/number_symbols.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  PreferenceService _preference = PreferenceService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHistory();
  }

  Gender? selectedGender;
  int height = 180;
  int weight = 30;
  int age = 19;

  List<String> bmiHistoryList = [];
  List<String> resultHistoryList = [];
  List<String> hourList = [];
  List<String> monthList = [];
  List<String> heightList = [];
  List<String> weightList = [];

  _getHistory() async{

    final historyGetter = await _preference.getHistory();
    bmiHistoryList = historyGetter.bmi;
    resultHistoryList = historyGetter.result;
    heightList = historyGetter.height;
    weightList = historyGetter.weight;
    hourList = historyGetter.hour;
    monthList = historyGetter.month;

  }
  @override
  Widget build(BuildContext context) {
    CalculatorBrain c = CalculatorBrain(height: height, weight: weight);

    History history = History(
      bmi: bmiHistoryList,
      result: resultHistoryList,
      height: heightList,
      weight: weightList,
      hour: hourList,
      month: monthList,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                color: kInactiveCardColour,
                child: const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text("Body Mass Index"),
                    Text("Measurement"),
                  ],
                )),
              )),
              ListTile(
                title: const Center(
                    child: Text(
                  "History",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )),
                onTap: () {
                  _getHistory();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoryPage(
                                bmi: bmiHistoryList,
                                result: resultHistoryList,
                                height: heightList,
                                weight: weightList,
                                hour: hourList,
                                month: monthList,
                              )));
                },
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      updateColor: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: "MALE"),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      updateColor: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text("cm", style: kLabelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1.0,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
                colour: kActiveCardColour,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColour,
                    ),
                  ),
                ],
              ),
            ),
            BottomContainer(
              navigate: () {

                String? hour;
                String? month;
                setState(() {
                  final DateTime time = DateTime.now();
                  hour = DateFormat().add_jm().format(time);
                  month = DateFormat().add_MMMd().format(time);
                  hourList.add(hour!);
                  monthList.add(month!);
                });




                bmiHistoryList.add(c.bmiCalculation());
                resultHistoryList.add(c.getResult());
                heightList.add(height.toString());
                weightList.add(weight.toString());
                hourList.add(hour!);
                monthList.add(month!);

                _preference.saveHistory(history);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmi: c.bmiCalculation(),
                      interpretation: c.getInterpretation(),
                      result: c.getResult(),
                    ),
                  ),
                );
              },
              title: "CALCULATE",
            ),
          ],
        ));
  }
}

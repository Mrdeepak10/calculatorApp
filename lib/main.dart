import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController numberController = TextEditingController();

  String? value1;
  String? operator = "default";
  String? value2;
  List<String> tmp1 = [];
  List<String> tmp2 = [];

  void calculate(text) {
    print(text);
    switch (text) {
      case '0':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '1':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
          print("if:$tmp1");
        } else {
          tmp2.add(text);
          setValue2();
          print("else:$tmp2");
        }
        break;

      case '2':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '3':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '4':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '5':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '6':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '7':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '8':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '9':
        if (operator == "default") {
          tmp1.add(text);
          setValue1();
        } else {
          tmp2.add(text);
          setValue2();
        }
        break;

      case '=':
        numberController.text = result();
        operator = "default";
        tmp1.clear();
        tmp2.clear();
        break;

      case '+':
        setState(() {
          operator = text;
          numberController.text = '0';
        });
        break;

      case '-':
        setState(() {
          operator = text;
          numberController.text = '0';
        });
        break;

      case 'x':
        setState(() {
          operator = text;
          numberController.text = '0';
        });
        break;

      case '/':
        setState(() {
          operator = text;
          numberController.text = '0';
        });
        break;

      case 'X':
        clear();
        break;
    }
  }

  clear() {
    if (operator == "default") {
      setState(() {
        if (tmp1.length > 0) {
          tmp1.removeLast();
          setValue1();
        } else {
          print("Cleared");
        }
      });
    } else {
      setState(() {
        if (tmp2.length > 0) {
          tmp2.removeLast();
          setValue2();
        } else {
          print("Cleared");
        }
      });
    }
  }

  setValue1() {
    setState(() {
      value1 = tmp1
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(",", "")
          .replaceAll(" ", "")
          .trim();
    });
    numberController.text = value1!;
  }

  setValue2() {
    setState(() {
      value2 = tmp2
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(",", "")
          .replaceAll(" ", "")
          .trim();
    });
    numberController.text = value2!;
  }

  String result() {
    String res = '0';
    switch (operator) {
      case '+':
        res = (int.parse(value1!) + int.parse(value2!)).toString();
        break;
      case '-':
        res = (int.parse(value1!) - int.parse(value2!)).toString();

        break;
      case '/':
        res = (int.parse(value1!) / int.parse(value2!)).toString();

        break;
      case 'x':
        res = (int.parse(value1!) * int.parse(value2!)).toString();

        break;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Icon(
              Icons.minimize,
            ),
          ),
          sizeBoxWidget(0, 5),
          Icon(
            Icons.check_box_outline_blank_sharp,
            size: 18,
          ),
          sizeBoxWidget(0, 5),
          Icon(Icons.close),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          resultOutputWidget(),
          rowWidget1(),
          sizeBoxWidget(5, 0),
          rowWidget2(),
          sizeBoxWidget(5, 0),
          rowWidget3(),
          sizeBoxWidget(5, 0),
          rowWidget4(),
        ],
      ),
    );
  }

  Widget resultOutputWidget() {
    return Expanded(
      child: Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFormField(
              readOnly: true,
              controller: numberController,
              decoration: InputDecoration(
                  disabledBorder: InputBorder.none, hintText: "0"),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget sizeBoxWidget(double h, double w) {
    return SizedBox(
      height: h,
      width: w,
    );
  }

  Widget rowWidget1() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('1');
              debugPrint("user pressed");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("1"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('2');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(
                  child: Text("2"),
                )),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('3');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("3"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('4');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("4"))),
          ),
        ),
        sizeBoxWidget(5, 5),
      ],
    );
  }

  Widget rowWidget2() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('5');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("5"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("6");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("6"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('7');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("7"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('8');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("8"))),
          ),
        ),
        sizeBoxWidget(5, 5),
      ],
    );
  }

  Widget rowWidget3() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('9');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("9"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate('0');
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Text("0"))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("X");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Icon(Icons.backspace))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("=");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(
                    child: Text(
                  " = ",
                  style: TextStyle(fontSize: 25),
                ))),
          ),
        ),
        sizeBoxWidget(5, 5),
      ],
    );
  }

  Widget rowWidget4() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("+");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Icon(Icons.add))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("x");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Icon(Icons.close))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("-");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child: Center(child: Icon(Icons.minimize_sharp))),
          ),
        ),
        sizeBoxWidget(5, 5),
        Expanded(
          child: GestureDetector(
            onTap: () {
              calculate("/");
            },
            child: Container(
                height: 40,
                width: 40,
                color: Colors.grey,
                child:
                    Center(child: Text(" / ", style: TextStyle(fontSize: 25)))),
          ),
        ),
        sizeBoxWidget(5, 5),
      ],
    );
  }
}

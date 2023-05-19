import 'package:flutter/material.dart';
void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title:"Simple Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText=="CLEAR"){
      _output="0";
      num1 = 0;
      num2 = 0;
      operand = "";
    }else if(buttonText=="+" || buttonText=="-" || buttonText=="x" || buttonText=="/"){
        num1 = double.parse(output);
        operand = buttonText;
        _output = "0";
        //num2 = double.parse(output);
    } else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already contains a decimal");
      } else {
        _output = _output+buttonText;

      }
    } else if(buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "x"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else
      {
        _output =_output+buttonText;

      }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget builButton(String buttonText)
  {
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            onPressed: ()=> buttonPressed(buttonText),
          ),
        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
              output,
                style: TextStyle(
                  fontSize: 48.4,
                  fontWeight: FontWeight.bold,
                ),

              ),
            ),
            Expanded(
              child: Divider(),
            ),
            new Column(
              children: [
              new Row(
                children: [
                  builButton("7"),
                  builButton("8"),
                  builButton("9"),
                  builButton("/"),
                ],
              ),
                new Row(
                  children: [
                    builButton("4"),
                    builButton("5"),
                    builButton("6"),
                    builButton("x"),
                  ],
                ),
                new Row(
                  children: [
                    builButton("1"),
                    builButton("2"),
                    builButton("3"),
                    builButton("-"),
                  ],
                ),
                new Row(
                  children: [
                    builButton("."),
                    builButton("0"),
                    builButton("00"),
                    builButton("+"),
                  ],
                ),
                new Row(
                  children: [
                    builButton("CLEAR"), builButton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}


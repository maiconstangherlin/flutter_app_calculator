import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/memory.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = new Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
      ),
      body: Column(
        children: [
          _buildDisplay(),
          Divider(height: 0.1),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: AutoSizeText(
                _memory.result,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none,
                    fontSize: 80.0,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label,
      {int flex = 1,
      Color textColor = Colors.white,
      Color backgroundColor = Colors.black}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: backgroundColor,
        textColor: textColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {
          setState(() {
            _memory.applyCommand(label);
          });
        },
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.black,
      height: 400.0,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildKeyboardButton('AC', textColor: Colors.deepOrange),
                _buildKeyboardButton('DEL', textColor: Colors.deepOrange),
                _buildKeyboardButton('%', textColor: Colors.deepOrange),
                _buildKeyboardButton('÷', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('+', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('-', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildKeyboardButton('0', flex: 2),
                _buildKeyboardButton('.'),
                _buildKeyboardButton('=', textColor: Colors.deepOrange),
              ],
            ),
          )
        ],
      ),
    );
  }
}

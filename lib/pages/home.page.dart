import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _alcoolController = TextEditingController();
  var _gasolinaController = TextEditingController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar Álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(reset: reset, result: _resultText)
                  : SubmitForm(
                      alcoolController: _alcoolController,
                      gasolinaController: _gasolinaController,
                      busy: _busy,
                      submitFunc: calculate)
            ],
          ),
        ));
  }

  Future calculate() async {
    double alcool =
        double.parse(_alcoolController.text.replaceAll(RegExp(r'[,.]'), '')) /
            100;
    double gasolina =
        double.parse(_gasolinaController.text.replaceAll(RegExp(r'[,.]'), '')) /
            100;
    double res = alcool / gasolina;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }
      });
    });
  }

  reset() {
    setState(() {
      _alcoolController = new TextEditingController();
      _gasolinaController = new TextEditingController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}

import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaController = new TextEditingController();
  var alcoolController = new TextEditingController();
  var busy = false;
  Function submitFunc;
  SubmitForm(
      {super.key,
      required this.alcoolController,
      required this.gasolinaController,
      required this.busy,
      required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(label: "Gasolina", ctrl: gasolinaController),
        ),
        Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Input(label: "Álcool", ctrl: alcoolController)),
        const SizedBox(
          height: 25,
        ),
        LoadingButton(
            busy: busy, invert: false, text: "CALCULAR", func: submitFunc)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:login/screen/register.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  ButtonState _buttonState = ButtonState.idle;

  void onPressed() async {
    setState(() {
      _buttonState = ButtonState.loading;
    });

    // Do some asynchronous operation here
    await Future.delayed(Duration(seconds: 1));

    // Check if the operation was successful or not
    bool isSuccess = false;

    setState(() {
      _buttonState = isSuccess ? ButtonState.success : ButtonState.fail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressButton.icon(
      iconedButtons: {
        ButtonState.idle: IconedButton(
            text: "Send",
            icon: Icon(Icons.send, color: Colors.white),
            color: Colors.deepPurple.shade500),
        ButtonState.loading:
            IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
        ButtonState.fail: IconedButton(
            text: "Failed",
            icon: Icon(Icons.cancel, color: Colors.white),
            color: Colors.red.shade300),
        ButtonState.success: IconedButton(
            text: "Success",
            icon: Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            color: Colors.green.shade400)
      },
      onPressed: onPressed,
      state: _buttonState,
    );
  }
}

import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  const SocialButton({Key key, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ElevatedButton(onPressed: onPressed, child: Icon(icon)),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

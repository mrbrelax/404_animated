import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorText extends StatefulWidget {
  const ErrorText({
    Key? key,
  }) : super(key: key);
  @override
  _ErrorTextState createState() => _ErrorTextState();
}

class _ErrorTextState extends State<ErrorText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/error_text.svg",
          height: MediaQuery.of(context).size.height / 3.15,
        ),
        SizedBox(height: 30),
        TextButton(
          onPressed: () {},
          child: Text("Back To Home".toUpperCase()),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF293047), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            textStyle: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

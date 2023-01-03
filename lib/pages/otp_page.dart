import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Assignment')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: 250,
                height: 250,
                child: SvgPicture.asset('asset/image/ic_phone.svg')),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width - 40,
              fieldWidth: 52,
              otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.black12, borderColor: Colors.black),
              style: const TextStyle(fontSize: 16),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: ((value) {
                debugPrint(value);
              }),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: "Send OTP again in ",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              TextSpan(
                text: "00:${30}",
                style: TextStyle(fontSize: 16, color: Colors.pinkAccent),
              ),
              TextSpan(
                text: " sec ",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              TextSpan(
                text: "Resend",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              )
            ])),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

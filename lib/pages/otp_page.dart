import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:test_assignment/provider/otp_provider.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({super.key});

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  String? smsCode;
  String? verificationId;
  late Timer _timer;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await setTimer();
    _getSendSms(context, ref.read(phoneNumberProvider));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

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
              onChanged: (value) {
                try {
                  if (value != null && value.length == 6) {
                    smsCode = value;
                  }
                } catch (e) {
                  debugPrint('Otp ${e.toString()} \n Value: $value');
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: "Send OTP again in ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextSpan(
                    text: "00:${ref.watch(timerProvider).toString()}",
                    style:
                        const TextStyle(fontSize: 16, color: Colors.pinkAccent),
                  ),
                  const TextSpan(
                    text: " sec ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ])),
                const SizedBox(
                  width: 8,
                ),
                Visibility(
                    visible: ref.watch(isResendOtp),
                    child: InkWell(
                      onTap: () {
                        setTimer();
                        _getSendSms(context, ref.read(phoneNumberProvider));
                      },
                      child: const Text(
                        'Resend',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    setTimer();
                    AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId ?? '',
                        smsCode: smsCode ?? '');
                    debugPrint(
                        'verificationId: $verificationId \smsCode: $smsCode');

                    debugPrint('Credential: $credential ');
                    debugPrint('accessToken: ${credential.accessToken} ');
                    debugPrint('providerId: ${credential.providerId} ');
                    debugPrint('signInMethod: ${credential.signInMethod} ');
                    debugPrint('token: ${credential.token} ');
                    debugPrint(
                        'uid: ${FirebaseAuth.instance.currentUser?.uid} ');
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      debugPrint('uid: ${value.user?.uid} ');
                      if (value.user != null) {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/home', ((route) => false));
                      }
                    });
                  } on FirebaseAuthException catch (e) {
                    debugPrint('Error ${e.message.toString()}');
                  }
                },
                child: const Text('Get Started'),
              ),
            )
          ]),
        ),
      ),
    );
  }

  _getSendSms(BuildContext context, String phoneNumber) async {
    smsOTPSent(String verId, int? resend) {
      verificationId = verId;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+62$phoneNumber',
        verificationCompleted: (credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: ((error) {
          debugPrint(error.message.toString());
          showNotification(context, error.message.toString());
        }),
        codeSent: smsOTPSent,
        codeAutoRetrievalTimeout: (_) {},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green.shade900,
        content: Text(message.toString())));
  }

  Future<void> setTimer() async {
    const onSec = Duration(seconds: 1);
    ref.read(timerProvider.notifier).state = 30;
    ref.read(isResendOtp.notifier).state = false;
    _timer = Timer.periodic(onSec, (timer) {
      if (ref.watch(timerProvider) == 0) {
        timer.cancel();
        ref.read(isResendOtp.notifier).state = true;
      } else {
        ref.read(timerProvider.notifier).state--;
      }
    });
  }
}

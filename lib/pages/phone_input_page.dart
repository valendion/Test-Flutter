import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_assignment/pages/otp_page.dart';
import 'package:test_assignment/provider/otp_provider.dart';

class PhoneInputPage extends ConsumerStatefulWidget {
  const PhoneInputPage({super.key});
  static var routeName = '/phonePage';

  @override
  ConsumerState<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends ConsumerState<PhoneInputPage> {
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
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
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                  controller: phoneController,
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your phone number',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      prefixIcon: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        child: Text(
                          '(+62)',
                          style: TextStyle(fontSize: 16),
                        ),
                      ))),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                onPressed: () {
                  if (FirebaseAuth.instance.currentUser == null) {
                    ref.read(phoneNumberProvider.notifier).state =
                        phoneController.text.toString();

                    Navigator.pushNamed(context, OtpPage.routeName);
                  }
                },
                child: const Text('Next'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

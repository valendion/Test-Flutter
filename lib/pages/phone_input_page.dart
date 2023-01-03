import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhoneInputPage extends StatelessWidget {
  const PhoneInputPage({super.key});

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
                  Navigator.pushNamed(context, '/otp');
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

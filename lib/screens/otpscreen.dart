import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:i4_consulting_app/utils/routes.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({ Key? key }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
 
 late EmailAuth emailAuth;

void sendOTP() async{
   emailAuth = EmailAuth(sessionName: "Test session",);
   await emailAuth.sendOtp(recipientMail: _emailcontroller.text);
}

  void verifyOTP() {
    (emailAuth.validateOtp(
        recipientMail: _emailcontroller.value.text,
        userOtp: _otpcontroller.value.text));
        moveTOhome(context);
  }

  dynamic moveTOhome(context)async{
    await Future<dynamic>.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Column(
        children: [
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter email',
                          labelText:'Email',
                          suffixIcon: TextButton(
                            child: const Text('Send OTP'),
                            onPressed: ()=> sendOTP(),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fill the email';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Email is not valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 
                        30.0,
                      ),
                      TextField(
                        controller: _otpcontroller,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter OTP',
                          labelText: 'OTP'
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        onPressed:() => verifyOTP(), 
                        child: const Text('Verify OTP') )
                    ],
                  ),
                  )
        ],
      ),
    );
  }
}
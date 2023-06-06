import 'package:flutter/material.dart';
import 'package:zigram_chat_app/screens/home/home_screen.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPhone extends StatefulWidget {
  const AuthPhone({super.key});
  static String id = 'main_phone_verification_page';

  @override
  State<AuthPhone> createState() => _AuthPhoneState();
}

class _AuthPhoneState extends State<AuthPhone> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  String _verificationId = '';

  Future<void> phoneAuthentication() async {
    String phoneNum = '+251${_phoneNumberController.text}';
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, HomeScreen.id);
      },
      codeSent: (String verificationId, resendingToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      verificationFailed: (exception) {
        var message = 'An error occurred, please check your credentials!';
        if (exception.code == 'invalid-phone-number') {
          message = exception.message!;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ));
        }
      },
      timeout: const Duration(seconds: 60),
    );
  }

  void signInWithOTP() async {
    String otp = _otpController.text.trim();
    // var credential = await _auth.signInWithCredential(
    //     PhoneAuthProvider.credential(
    //         verificationId: _verificationId.value, smsCode: otp));
    // return credential.user != null ? true : false;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    await _auth.signInWithCredential(credential);
    // Handle success scenario
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  // void _trySubmit() {
  //   final isValid = _formKey.currentState!.validate();
  //   FocusScope.of(context).unfocus();
  //   // if (_userImageFile == null && !_isLogin) {
  //   //   ScaffoldMessenger.of(context).showSnackBar(
  //   //     SnackBar(
  //   //       content: Text('Please pick an image'),
  //   //       backgroundColor: Colors.red,
  //   //     ),
  //   //   );
  //   // return;

  //   if (isValid) {
  //     _formKey.currentState!.save();
  //     var phoneNo;
  //     phoneAuthentications(phoneNo.text.trim());
  //     // print(_userEmail);
  //     // print(_userName);
  //     // print(_userPassword);
  //     // print(_userImageFile);
  //     // Use those values to send our auth request ...
  //   }
  // }

  // void phoneAuthentications(String phoneNo) {
  //   phoneAuthentication(phoneNo);
  // }

//**
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff3a50ef),
          title: const Text(
            'Phone Verification',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 15,
              color: Color(0xffffffff),
            ),
          ),
          //title: const Text('Phone Verification'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Please confirm your country code and enter your mobile phone number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14,
                        color: Color.fromARGB(255, 48, 48, 48),
                      ),
                    ),

                    // const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    const Padding(
                      padding: EdgeInsets.all(20),
                    ),

                    // IntlPhoneField(
                    TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '| 911 07 89 **',
                        labelText: '| Phone Number*',
                        // labelText: 'Phone Number *',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      // onChanged: (phone) {
                      //   // This optional block of code can be used to run
                      //   // code when the user saves the form.
                      //   print(phone.completeNumber);
                      // },
                      // onCountryChanged: (country) {
                      //   print('Country changed to: ' + country.name);
                      // },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // MaterialButton(
                    //   child: const Text('Submit'),
                    //   color: Theme.of(context).primaryColor,
                    //   textColor: Colors.white,
                    //   onPressed: () {
                    //     _formKey.currentState?.validate();
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: phoneAuthentication,
              child: Text('Send OTP'),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: signInWithOTP,
              child: const Text('Verify OTP'),
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     //
            //     _trySubmit();
            //     //
            // Navigator.pushNamed(context, HomeScreen.id);
            //     // Navigator.of(context).push(

            //     //   // MaterialPageRoute(builder: (_) => OtpVerificationpage()),
            //     // );
            //   },
            //   child: Icon(Icons.arrow_forward),
            // ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:http/http.dart' as http;

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  int _counter = 0;
  late Timer _timer;
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  // Navigate back to the previous screen

                  Navigator.pop(context);
                  setState(() {});
                })),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 250,
                  height: 200,
                  child: Image(image: AssetImage('assets/images/otp.jpeg')),
                ),
              ),
              Row(children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: Text(
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                      "         OTP Verification"),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: Container(
                  child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 99, 97, 97),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      "We have sent a unique OTP number \n to your mobile +91 ${localStorage.getItem('mobile_Number')} "),
                ),
                width: 500,
              ),
              SizedBox(
                height: 30,
              ),
              OtpPinField(
                  key: _otpPinFieldController,
                  otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                  highlightBorder: false,
                  otpPinFieldStyle: OtpPinFieldStyle(
                      defaultFieldBorderColor: Colors.black,
                      fieldBorderRadius: 10),
                  onSubmit: (text) async {
                    Navigator.pushNamed(context, '/mainPage');
                    var otp_url = Uri.parse(
                        'http://devapiv4.dealsdray.com/api/v2/user/otp/verification');

                    await http.post(otp_url, body: {
                      "otp": "9879",
                      "deviceId": "62b43472c84bb6dac82e0504",
                      "userId": "62b43547c84bb6dac82e0525"
                    }).then((response) => {
                          if (response.statusCode == 200)
                            {}
                          else
                            {
                                 

                               
                            }
                        });
                  },
                  onChange: (value) {
                    print(value);
                  }),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                    height: 30,
                    width: 230,
                    child: SingleChildScrollView(
                      child: Row(children: [
                        Text(style: TextStyle(fontSize: 17), "00:${_counter}"),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child: Text(
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                              "SEND AGAIN"),
                        )
                      ]),
                    )),
              )
            ],
          ),
        ));
  }
}

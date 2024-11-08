import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool boolean = false;
  bool toogleswitch = true;
  var Signup = {
    "email": "muhammedrafnasvk@gmail.com",
    "password": "1234Rafnas",
    "referralCode": 12345678,
    "userId": "62a833766ec5dafd6780fc85"
  };
  var logindata = {
    "mobileNumber": "9011470243",
    "deviceId": "62b341aeb0ab5ebe28a758a3"
  };
  final otpurl = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 254, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 254, 254, 1),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                // Navigate back to the previous screen
                setState(() {
                  boolean = !boolean;
                });
              })),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                  width: 200,
                  height: 160,
                  image: AssetImage('assets/images/unnamed.png')),
            ),
            boolean
                ? SizedBox(
                    child: Container(
                      width: 1000,
                      child: Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          "      Let's Begin!"),
                    ),
                    width: 1000,
                    height: 50,
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 20, 0, 0),
                      child: Row(
                        children: [
                          ToggleSwitch(
                            minWidth: 100.0,
                            cornerRadius: 20.0,
                            activeBgColor: [Colors.red],
                            activeFgColor: Colors.white,
                            inactiveBgColor:
                                const Color.fromARGB(255, 224, 221, 221),
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: toogleswitch ? 0 : 1,
                            totalSwitches: 2,
                            customTextStyles: [
                              toogleswitch
                                  ? null
                                  : TextStyle(
                                      color: Colors.black,
                                    ),
                              toogleswitch
                                  ? TextStyle(
                                      color: Colors.black,
                                    )
                                  : null
                            ],
                            labels: ['Phone', 'Email'],
                            radiusStyle: true,
                            onToggle: (index) {
                              toogleswitch = !toogleswitch;
                            },
                          ),
                        ],
                      ),
                    )),
            boolean
                ? SizedBox()
                : SizedBox(
                    height: 40,
                    child: Container(),
                  ),
            boolean
                ? SizedBox()
                : SizedBox(
                    child: Container(
                      width: 1000,
                      child: Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          "      Glad to see you!"),
                    ),
                    width: 1000,
                    height: 50,
                  ),
            boolean
                ? SizedBox(
                    height: 40,
                    child: Container(
                      child: Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 99, 97, 97),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                          "            Please enter your credentials to proceed "),
                    ),
                    width: 500,
                  )
                : SizedBox(
                    height: 40,
                    child: Container(
                      child: Text(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 99, 97, 97),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                          toogleswitch
                              ? "            Please provide your phone number"
                              : "            Please provide your email"),
                    ),
                    width: 500,
                  ),
            boolean
                ? SizedBox(
                    width: 300,
                    height: 50,
                    child: Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Your Email",
                        ),
                        onChanged: (value) {
                          Signup['email'] = "${value}";
                          // Handle change in input text here
                        },
                      ),
                    ),
                  )
                : SizedBox(
                    width: 300,
                    height: 50,
                    child: Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: toogleswitch ? "Phone" : "Email",
                        ),
                        onChanged: (value) {
                          // Handle change in input text here

                          logindata["mobileNumber"] = "$value";
                        },
                      ),
                    ),
                  ),
            boolean
                ? SizedBox()
                : SizedBox(
                    height: 40,
                  ),
            boolean
                ? SizedBox(
                    width: 300,
                    height: 60,
                    child: Container(
                      width: 300,
                      child: TextField(
                        onChanged: (value) => {Signup['password'] = "${value}"},
                        obscureText: true, // Hides the text
                        decoration: InputDecoration(
                          labelText: ' Create Password',

                          suffixIcon: Icon(Icons
                              .remove_red_eye_rounded), // Adds an icon to indicate password field
                        ),
                      ),
                    ))
                : SizedBox(
                    width: 300,
                    height: 50,
                    child: Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Set the background color
                            foregroundColor: Colors.white, // Set text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12), // Set border radius
                            ),
                          ),
                          onPressed: () async {
                            try {
                              var response =
                                  await http.post(otpurl, body: logindata);
                              
                              var data = jsonDecode(response.body);
                              if (response.statusCode == 200) {
                                 Navigator.pushNamed(context, '/register');
                                localStorage.setItem("mobile_Number",
                                    logindata['mobileNumber'].toString());
                               
                                localStorage.setItem('data', data);
                                localStorage.setItem("mobile_Number",
                                    logindata['deviceId'].toString());
                                print(data);
                              } else {
                                _showMyDialog();
                              }
                            } catch (e) {}
                          },
                          child: Text("SEND CODE")),
                    ),
                  ),
            boolean
                ? SizedBox(
                    width: 300,
                    height: 50,
                    child: Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Referal Code (Optional)",
                        ),
                        onChanged: (value) {
                          // Handle change in input text here
                          print('Text input: $value');
                        },
                      ),
                    ),
                  )
                : SizedBox(),
            boolean
                ? SizedBox(
                    height: 150,
                  )
                : SizedBox(),
            boolean
                ? Padding(
                    padding: EdgeInsets.fromLTRB(250, 0, 0, 10),
                    child: FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                                boolean=!boolean;
                              });
                        await http.post(
                            Uri.parse(
                                'http://devapiv4.dealsdray.com/api/v2/user/email/referral'),
                            body: Signup).then((response){
                                       
                              
                            }).catchError((error){

                            });
                      },
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                      splashColor: Colors.pinkAccent,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
    ;
  }

  Future<void> _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

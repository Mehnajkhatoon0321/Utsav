import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:utsavfashion/Screen/Homepage/homepage.dart';
import 'package:utsavfashion/Screen/Login/Emaillogin.dart';
import 'package:utsavfashion/Screen/Login/Resetpass.dart';
import 'package:utsavfashion/utils/appcolor.dart';
import 'package:utsavfashion/utils/help.dart';

class forgopas extends StatefulWidget {
  const forgopas({Key? key}) : super(key: key);

  @override
  State<forgopas> createState() => _forgopasState();
}

class _forgopasState extends State<forgopas> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController emailname=TextEditingController();
  bool isChecked = false;
  bool passvisible = false;
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(children: <Widget>[
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Forgot Your Password",
                    style: Stylestext.heading,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.040,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(  textScaleFactor: 1.0,
                      "Please enter your email address below. You will receive a link to reset your password.",
                      style: Stylestext.logmainhead,textAlign: TextAlign.left,
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        Form(
                          key: _key,
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Email Address",
                                    style: Stylestext.logmainhead,
                                    textScaleFactor: 1.0,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Appcolors.star,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            TextFormField(
                              controller: emailname,

                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Example@gmail.com',
                                hintStyle: Stylestext.hint,
                              ),     autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                              RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if(value!.isEmpty){
                                return ("Email is required.");
                              }
                              else if(!regex.hasMatch(value)){
                                return ("Enter valid email address.");
                              }
                              return null;
                            },
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: height * 0.030,
                        ),
                        SizedBox(

                          height: height * 0.067,
                          width: width * 362,
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Reset ()));
                                  }

                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Appcolors.Splashheading, // background
                                ),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                label: const Align(
                                    child: Text(
                                      "SEND RESET LINK",
                                      style: TextStyle(
                                          fontFamily: 'NotoSans',
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )),
                              )),
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                        TextButton(
                          onPressed: () {

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Emaillogin ()));

                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                              child: Text('Back to Login',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff2C8FEB),

                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        )
                      ]))
                ]))));
  }
}

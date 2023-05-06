import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:utsavfashion/Screen/Login/Emaillogin.dart';
import 'package:utsavfashion/utils/appcolor.dart';
import 'package:utsavfashion/utils/help.dart';
class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}
var isLoading = false;
class _ResetState extends State<Reset> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController newpass=TextEditingController();
  TextEditingController conpass=TextEditingController();
  bool isChecked = false;
  bool passvisible = false;
  bool passvisi = false;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    passvisible = true;
  }
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
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/images/icon.png",
                        height: 55,
                        width: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Reset a Password",
                    style: Stylestext.heading,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.040,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Please enter your email address below. You will receive a link to reset your password.",
                        style: Stylestext.logmainhead,
                      ),
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Form(
                          key:  _key,
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text(
                                    "New Password",
                                    style: Stylestext.logmainhead,
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
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ], controller: newpass,
                              keyboardType: TextInputType.text,
                              obscureText: passvisible,
                              decoration: InputDecoration(
                                hintText: 'XXXXXXXXXXX',
                                hintStyle: Stylestext.hint,
                                suffixIcon: IconButton(
                                  color: Colors.grey,
                                  icon: Icon(passvisible
                                      ? Icons.visibility_off
                                      : Icons.visibility ),
                                  onPressed: () {
                                    setState(
                                          () {
                                        passvisible = !passvisible;
                                      },
                                    );
                                  },
                                ),
                              ),  // },
                              validator: (PassCurrentValue){
                                RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                var passNonNullValue=PassCurrentValue??"";
                                if(passNonNullValue.isEmpty){
                                  return ("Password is required.");
                                }
                                else if(passNonNullValue.length<6){
                                  return ("Password Must be more than 5 characters .");
                                }
                                else if(!regex.hasMatch(passNonNullValue)){
                                  return ("Password should contain upper,lower,digit and Special character. ");
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Confirm New Password",
                                    style: Stylestext.logmainhead,
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
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              controller: conpass,
                              keyboardType: TextInputType.text,
                              obscureText: passvisible,
                              decoration: InputDecoration(
                                hintText: 'XXXXXXXXXXX',
                                hintStyle: Stylestext.hint,
                                suffixIcon: IconButton(
                                  color: Colors.grey,
                                  icon: Icon(passvisi
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(
                                          () {
                                        passvisi = !passvisi;
                                      },
                                    );
                                  },
                                ),
                              ), validator: (PassCurrentValue){
                              RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              var passNonNullValue=PassCurrentValue??"";
                              if(passNonNullValue.isEmpty){
                                return ("Please re-enter password.");
                              }
                              if(passNonNullValue!=newpass.text){
                                return ("Password must be same.");
                              }

                              return null;
                            },
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                          ]),
                        ),

                        SizedBox(
                          height: height * 0.010,
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
                                            const Emaillogin()));
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
                                      "RESET PASSWORD",
                                      style: TextStyle(
                                          fontFamily: 'NotoSans',
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )),
                              )),
                        ),


                      ])
                  ),
                  SizedBox(
                    height: height * 0.040,
                  ),
                ])

            )
        )
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:utsavfashion/Screen/Homepage/homepage.dart';
import 'package:utsavfashion/Screen/Login/createaccount.dart';
import 'package:utsavfashion/Screen/Login/forgotpassword.dart';
import 'package:utsavfashion/utils/appcolor.dart';
import 'package:utsavfashion/utils/help.dart';

class Emaillogin extends StatefulWidget {
  const Emaillogin({Key? key}) : super(key: key);

  @override
  State<Emaillogin> createState() => _EmailloginState();
}

class _EmailloginState extends State<Emaillogin> {
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController emailname=TextEditingController();
  TextEditingController passname=TextEditingController();
  var isLoading = false;
  bool isChecked = false;
  bool  passvisible = false;
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
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    // padding: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
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
                    "Login to Utsav Fashion",
                    style: Stylestext.heading,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.040,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:
                    Column(
                      children: [
                        Form(
                          key: _key,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child:
                                Row(
                                  children: [
                                    Text(
                                      "Email Address",
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
                              TextFormField( inputFormatters: [

                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s')),
                              ],
                                controller: emailname,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Example@gmail.com',
                                   hintStyle: Stylestext.hint,
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              Align(
                                alignment: Alignment.topLeft,
                                child:
                                Row(
                                  children: [
                                    Text(
                                      "Password",
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
                                controller: passname,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(16),
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                keyboardType: TextInputType.text,
                                obscureText:   passvisible,
                                decoration: InputDecoration(
                                  hintText: 'XXXXXXXXXXX',
                                  hintStyle: Stylestext.hint,
                                  suffixIcon: IconButton(
                                    color: Colors.grey,
                                    icon: Icon(  passvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(
                                        () {
                                          passvisible = !  passvisible;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                validator: (PassCurrentValue){
                                  RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  var passNonNullValue=PassCurrentValue??"";
                                  if(passNonNullValue.isEmpty){
                                    return ("Password is required.");
                                  }
                                  else if(passNonNullValue.length<6){
                                    return ("Password must be more than 5 characters.");
                                  }
                                  else if(!regex.hasMatch(passNonNullValue)){
                                    return ("Password should contain upper,lower,digit and Special character.");
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                              ),
                              SizedBox(
                                height: height * 0.010,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => forgopas()));

                                    },
                                    child: Text('Recover Password?',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff2C8FEB),
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left),
                                  ),

                                   TextButton(
                                     onPressed: () {
                                       Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) => Createaccount()));

                                     },
                                     child: Text('Create an Account',
                                         textScaleFactor: 1.0,
                                         style: TextStyle(
                                             fontSize: 14,
                                             color: Color(0xff2C8FEB),

                                             fontWeight: FontWeight.w400),
                                         textAlign: TextAlign.left),
                                   )
                                ],
                              ),
                            ],
                          ),
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
                                            const Homepage()));
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
                                      "LOGIN",
                                      style: TextStyle(
                                          fontFamily: 'NotoSans',
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    )),
                              )),
                        ),




                        SizedBox(
                          height: height * 0.050,
                        ),
                        const Text(
                          "Or Easily Using",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            color: Colors.grey,

                          ),
                        ),
                        SizedBox(
                          height: height * 0.050,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                child: Container(
                                  width: height * 0.060,
                                  height: height * 0.060,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    // border: Border.all(color: Colors.grey, width: 1),
                                    shape: BoxShape.circle,
                                     // color: Colors.white
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 72.0,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage('assets/images/fac.png'),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage()));
                                }),
                            const SizedBox(
                              width: 25,
                            ),
                            InkWell(
                                child: Container(
                                  width: height * 0.060,
                                  height: height * 0.060,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[100],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 72.0,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(
                                          'assets/images/Ggg.png'),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Homepage()));
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: height*0.00,),
                ],
              ),
            )));
  }
}

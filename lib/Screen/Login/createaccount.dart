import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:utsavfashion/Screen/Homepage/homepage.dart';
import 'package:utsavfashion/Screen/Login/Emaillogin.dart';
import 'package:utsavfashion/Screen/Login/forgotpassword.dart';
import 'package:utsavfashion/utils/appcolor.dart';
import 'package:utsavfashion/utils/help.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({Key? key}) : super(key: key);

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {


  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController emailname=TextEditingController();
  TextEditingController passname=TextEditingController();
  bool isChecked = false;
  bool  passvisible = false;

  var isLoading = false;
  @override
  void initState() {
    passvisible=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return
      MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Padding(
                padding:  EdgeInsets.only(top: 0, left: 10),
                child: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children:[
                Column(
                  children: [
                    Padding(
                      // padding: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                      "Create an Account",
                      style: Stylestext.heading,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.040,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Form(
                            key: _key,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        "First Name",
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
                                  LengthLimitingTextInputFormatter(30),
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                  controller: firstname,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: 'Umair',
                                    hintStyle: Stylestext.hint,
                                  ),
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^[a-z A-Z]+$');
                                    if(value!.isEmpty){
                                      return ("Enter your first name.");
                                    }
                                    else if(value.length<5){
                                      return ("Name must be more than 4 characters.");
                                    }
                                    else if(!regex.hasMatch(value)){
                                      return ("Name should not contain digit and special character .");
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
                                        "Last Name",
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
                                    LengthLimitingTextInputFormatter(30),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  controller: lastname,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Siddiqui',
                                    hintStyle: Stylestext.hint,

                                  ),
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^[a-z A-Z]+$');
                                    if(value!.isEmpty){
                                      return ("Enter your last name.");
                                    }
                                    else if(value.length<5){
                                      return ("Name must be more than 4 characters.");
                                    }
                                    else if(!regex.hasMatch(value)){
                                      return ("Name should not contain digit and special character .");
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
                                TextFormField(
                                  controller: emailname,
                                  inputFormatters: [

                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],

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
                                  height: height * 0.020,
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
                                  height: height * 0.010,
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
                                SizedBox(
                                  height: height * 0.020,
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
                                          // if()
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => Homepage()));
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
                                              "REGISTER",
                                              style: TextStyle(
                                                  fontFamily: 'NotoSans',
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Already have an account? ',
                                      style: TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: Colors.black,
                                      ),
                                    ),
                                    InkWell(
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                            fontWeight:FontWeight.w600,
                                            color: Color(0xff2C8FEB),
                                            decoration: TextDecoration.underline,
                                            decorationColor: Color(0xff2C8FEB),
                                            // fontSize: 20
                                          ),
                                        ),
                                        onTap: () {

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const Emaillogin()));
                                        }


                                      // (Route<dynamic> route) => false);
                                      //signup screen

                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.090,
                                ),
                              ],
                            ),
                          ),





                        ],
                      ),
                    ),
                  ],
                )
              ]),
            )));
  }
}

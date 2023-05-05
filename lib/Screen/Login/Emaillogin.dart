import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:utsavfashion/Screen/Homepage/homepage.dart';

class Emaillogin extends StatefulWidget {
  const Emaillogin({Key? key}) : super(key: key);

  @override
  State<Emaillogin> createState() => _EmailloginState();
}

class _EmailloginState extends State<Emaillogin> {
  final GlobalKey<FormState> _key = GlobalKey();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool passwordVisible = false;
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
            body: ListView(
              children: <Widget>[
                Padding(
                  // padding: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                  // style: FTextStyle.headingStyle,
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
                        key: formKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Email Address",
                                    // style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Example@gmail.com',
                                // hintStyle: FTextStyle.formfieldhintStyle,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Password",
                                    // style: FTextStyle.formfieldHeadingText,
                                  ),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                hintText: 'XXXXXXXXXXX',
                                // hintStyle: FTextStyle.formfieldhintStyle,
                                suffixIcon: IconButton(
                                  color: Colors.grey,
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(
                                      () {},
                                    );
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This is a required field.';
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.050,
                      ),
                      const Text(
                        "Or Easily Using",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          // fontSize: 20,
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold
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
                                    backgroundImage: AssetImage(
                                        'images/socialImg/Facebook.png'),
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
                                        'images/socialImg/Google.png'),
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
            )));
  }
}

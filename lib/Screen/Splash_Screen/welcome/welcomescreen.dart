import 'package:flutter/material.dart';
import 'package:utsavfashion/Screen/Homepage/homepage.dart';
import 'package:utsavfashion/Screen/Login/Emaillogin.dart';
import 'package:utsavfashion/utils/appcolor.dart';

class welcomes extends StatefulWidget {
  const welcomes({Key? key}) : super(key: key);

  @override
  State<welcomes> createState() => _welcomesState();
}

class _welcomesState extends State<welcomes> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return   MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    child: Scaffold(
    backgroundColor:Colors.white,
    body:  Padding(
      padding: const  EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ListView(
      children:  [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
        SizedBox(
        height: height * 0.040,
      ),
        Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/icon.png',
              width: 140,
              height: 140,
            )),
        SizedBox(
          height: height * 0.010,
        ),
        const Align(
          alignment: Alignment.center,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Text('Welcome',
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
          ),
        ),
            SizedBox(
              height: height * 0.010,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Utsav',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                ),

                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(' fashion',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolors.Splashheading,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                )
              ],
            ),
            SizedBox(
              height: height * 0.060,
            ),
            Padding(
              padding: const  EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(

                decoration: BoxDecoration(

                    border: Border.all(color: Appcolors.gray)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Image.asset('assets/images/Ggg.png'),
                        iconSize: 25,
                        onPressed: () {

                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),textAlign: TextAlign.left
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(



                decoration: BoxDecoration(

                    border: Border.all(color: Appcolors.gray)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Image.asset('assets/images/fac.png'),
                        iconSize: 25,
                        onPressed: () {

                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "Continue with Facebook",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),textAlign: TextAlign.left
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 1,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(



                decoration: BoxDecoration(

                    border: Border.all(color: Appcolors.gray)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Image.asset('assets/images/Email.png'),
                        iconSize: 25,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Emaillogin()));
                        },
                      ),
                    ),
              TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Emaillogin()));

              },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "Continue with Email",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),textAlign: TextAlign.left
                      ),
                    ),

              ) ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.010,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Homepage()));

                },
          child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Text('Continue as a Guest',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff2C8FEB),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff2C8FEB),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            ),
            ),
            SizedBox(
              height: height * 0.040,
            ),
      ])
     ] ),
    )
    )
    );
  }
}

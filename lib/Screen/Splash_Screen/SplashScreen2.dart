import 'package:flutter/material.dart';
import 'package:utsavfashion/Screen/Splash_Screen/welcome/welcomescreen.dart';

import 'package:utsavfashion/utils/appcolor.dart';
import 'package:utsavfashion/utils/help.dart';


class Splash_second extends StatefulWidget {
  const Splash_second({Key? key}) : super(key: key);

  @override
  State<Splash_second> createState() => _Splash_secondState();
}

class _Splash_secondState extends State<Splash_second> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            backgroundColor:Colors.white,
            body: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListView(children: <Widget>[
                  SizedBox(height: size.height * 0.060),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 7,
                                  child: Image.asset(
                                   "assets/images/splash.png",
                                    height: size.height * 0.080,
                                    width: size.width * 0.080,
                                  ),
                                ),
                                Padding(
                                  padding:  const EdgeInsets.fromLTRB(20, 0, 0, 40),
                                  child: TextButton(
                                    onPressed: () {
                                      print(
                                          "Height:-${size.height}, Weight${size.width}");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const welcomes(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(30, 30),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      alignment: Alignment.centerLeft,
                                    ),

                                      child:  const Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                                        child: Text(
                                          "Skip",
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            fontFamily: 'SourceSansPro',
                                            color:Appcolors.Skip,

                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.080),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "assets/images/mid.png",
                            height: size.height * 0.200,
                          ),
                        ),
                        SizedBox(height: size.height * 0.040),
                        const Text(
                          "${Textapplication.miss}",
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: Appcolors.Splashheading,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(33, 11, 33, 0),
                          child: Text(
                            "${Textapplication.testRegister}",
                            textAlign: TextAlign.center,
                            style: Stylestext.text
                          ),
                        ),
                        const Padding(
                          padding:EdgeInsets.fromLTRB(33, 11, 33, 0),
                          child: Text(
                            Textapplication.textinfo,
                            textAlign: TextAlign.center,
                            style:  Stylestext.textsize
                          ),
                        ),
                        SizedBox(
                          height: height * 0.110,
                        ),
                        InkWell(
                            child: Container(
                              width: width / 4,
                              height: height / 12,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Appcolors.gray, width: 1),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child:  Image.asset(
                                "assets/images/back.png",

                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const welcomes()));
                              // (Route<dynamic> route) => false);
                            }),
                      ])

                ]
                )
            )
        )
    );
  }
}

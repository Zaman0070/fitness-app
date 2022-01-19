import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_style_app/auth/email_screen.dart';
import 'package:life_style_app/auth/google_screen.dart';
import 'package:life_style_app/service/phone_service.dart';
import 'dart:convert';
import 'package:sizer/sizer.dart';



String prettyPrint(Map json) {
  JsonEncoder encoder =  JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/background.png'),
            )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 55.h,),
            Container(
              height: 44.h,
              width: double.infinity,
              //color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  InkWell(
                    onTap: (){
                      PhoneService().signInWithFacebook(context);
                    },
                    child: Container(
                      height: 6.h,
                      width: 80.w,
                      color: Color(0xff3b5998),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                           Container(
                             height: 6.h,
                             width: 15.w,
                             color: Colors.white10,
                             child: Image.asset('assets/icons/facebook.png',color: Colors.grey.shade300,),
                           ),
                            Center(child: Text('الدخول باستخدام الفايسبوك',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp
                            ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 15,),
                  InkWell(
                    onTap: ()async {
                      User? user =await GoogleAuth.signInWithGoogle(context: context);
                      if(user!=null){
                        PhoneService _auth = PhoneService();
                        _auth.addUser(context, user.uid);
                      }
                    },
                    child: Container(
                      height: 6.h,
                      width: 80.w,
                      color: Colors.red.shade700,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Container(
                              height: 6.h,
                              width: 16.w,
                              color: Colors.white10,
                              child: Image.asset('assets/icons/email.png',color: Colors.grey.shade300,),
                            ),
                            SizedBox(width: 6,),
                            Center(child: Text('الدخول باستخدام الإيميل',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>EmailScreen()));

                    },
                    child: Text('ليس عندي حساب',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text('نسيت كلمة السر    ؟',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

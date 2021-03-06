
import 'package:flutter/material.dart';
import 'package:life_style_app/screens/bmi_calculator/show_value.dart';
import 'package:life_style_app/screens/drawers/f_l_drawer.dart';
import 'package:sizer/sizer.dart';

import 'field_text.dart';


class BmiHome extends StatefulWidget {
  const BmiHome({Key? key}) : super(key: key);

  @override
  _BmiHomeState createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    ageController.dispose();
    hieghtController.dispose();
    weightController.dispose();
    super.dispose();
  }

  String age = '';
  String hieght = '';
  String weight = '';
  TextEditingController ageController = TextEditingController();
  TextEditingController hieghtController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  static const LinearGradient createGradient = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [Color(0XFFF6A419), Color(0XFFF6A419)]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      endDrawer: FemaleLossDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                    Builder(
                      builder: (context){
                        return IconButton(onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                            icon: Image.asset('assets/icons/menu.png',fit: BoxFit.cover,color: Colors.black,)
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 20.h,
                    width: 70.w,
                    child: Image.asset('assets/bmi.jpg'),
                  ),
                   SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 7.h,
                    width: 70.w,
                    color: Color(0xffF6A419),
                    child:  Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Text(
                        '?????????? ??????????',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      '?????????????? ???????? ???????? ???????? ???????????? ?????? ?????????? ???? ?????? ?????? ?????? ???????? ???????????? ?????????? . ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        letterSpacing: -3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18),
                    child: Column(
                      children: [
                        kmyText(
                          mycontroller: ageController,
                          hintText: '??????????',
                          icon: Icons.watch_later_outlined,
                          onchanged: (valueAge) {
                            setState(() {
                              age = valueAge;
                            });
                            print(age);
                          },
                        ),
                        kmyText(
                          mycontroller: hieghtController,
                          hintText: '?????????? ?????????????????? ',
                          icon: Icons.thermostat,
                          onchanged: (valueHeight) {
                            setState(() {
                              hieght = valueHeight;
                            });
                            print(hieght);
                          },
                        ),
                        kmyText(
                          mycontroller: weightController,
                          hintText: '?????????? ??????????????????????',
                          icon: Icons.monitor_weight_outlined,
                          onchanged: (valueWeight) {
                            setState(() {
                              weight = valueWeight;
                            });
                            print(weight);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffF6A419),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                        label: const Text(
                          '?????????? ????????',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        onPressed: () {
                          if (age == '' || hieght == '' || weight == '') {
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => ShowValues(
                                      height: hieght,
                                      weight: weight,
                                      age: age,
                                    )));
                            ageController.clear();
                            hieghtController.clear();
                            weightController.clear();
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
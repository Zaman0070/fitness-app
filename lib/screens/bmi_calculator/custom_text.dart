import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final IconData icon;
  final String textUSer;
  final String hintText;
  const CustomText(
      {Key? key,
        required this.icon,
        required this.textUSer,
        required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 8.h,
        width: 80.w,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffF6A419),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 45,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              textUSer,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              hintText,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
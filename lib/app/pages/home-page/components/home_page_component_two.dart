import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/button_class.dart';

class HomePageComponentTwo extends StatelessWidget {
  const HomePageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.7,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ButtonClass(shiftTime: '08.00 - 10.00', onTap: () {});
          },
        ),
      ],
    );
  }
}

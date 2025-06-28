import 'package:capstone_project_2/common/colors.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyColor,
                ),
              ),
              SizedBox(width: 10,),

            ],
          ),
        ],
      ),
    ));
  }
}

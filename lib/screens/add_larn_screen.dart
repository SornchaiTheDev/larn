import 'package:flutter/material.dart';
import 'package:larn/widgets/add_larn_widget.dart';
import 'package:larn/widgets/back_button_widget.dart';

class AddLarnScreen extends StatelessWidget {
  const AddLarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopNavigation(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
              itemCount: 10,
              itemBuilder: (context, index) => const AddLarnWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class TopNavigation extends StatelessWidget {
  const TopNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 48),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BackButtonWidget(),
            ),
            Text(
              "เพิ่มหลาน",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

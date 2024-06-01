// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key,required this.phoneNumber});
  final String phoneNumber;

  @override
  State<VerifyOtpPage> createState() => __VerifyOtpPageState();
}

class __VerifyOtpPageState extends State<VerifyOtpPage> {
  String otp = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.phoneNumber}'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
       
      ),
       body:SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children:[
                  const Text("Enter the OTP sent to your phone"),
                  const SizedBox(height: 40),
                  Pinput(
                    length:6,
                    onChanged: (value) => setState(() => otp = value),
                    onCompleted: (value){
                      print("HELLOO");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
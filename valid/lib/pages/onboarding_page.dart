 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:valid/pages/phone_page.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white ,
      
      body: SafeArea(
        child:Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset('images/gib.gif',
              height: 400,
             width: 400,
              ),
        
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
              child: SelectableText(
                'Welcome to Phone Authentication',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                 
                ),
              ),
            ),
          ),
          
          SizedBox(height: 20),          
          FilledButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context, 
              MaterialPageRoute(
                builder: (context) => const PhonePage()
                 ));
            },
            label: const SelectableText('Continue with Phone'),
            icon: const Icon(CupertinoIcons.phone_fill),
           )

          ],
        ),
      ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:valid/pages/verifyotp.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {

  bool enableotp=false;
  String phoneNumber = '';
  getOtp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VerifyOtpPage(phoneNumber: phoneNumber)));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Enter your phone number'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children:[
                Text("we need to verify your device"),
                SizedBox(height: 40),
               InternationalPhoneNumberInput(
                      onInputValidated: (value){
                        setState(() {
                          enableotp=value;
                        });
                      },
                      
                      onInputChanged: (value) {
                        setState(() {
                          phoneNumber = value.phoneNumber??'';
                        
                        });
                        print(phoneNumber);
                      },
                           formatInput: true,
                      autoFocus: true,
                      keyboardType: TextInputType.phone,   
                        selectorConfig: const SelectorConfig(
                          useEmoji: true,
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                              
                      inputDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone number',
                      
                      ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child:FilledButton(
                      onPressed:enableotp?getOtp:null,
                      child: Text('Get Otp'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
  }
}
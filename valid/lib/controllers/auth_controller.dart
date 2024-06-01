import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:valid/pages/verifyotp.dart';
import 'package:valid/pages/HomePage.dart';

class PhoneAuthController
{
  static final _auth=FirebaseAuth.instance;
  static Future<void> sendOtp(BuildContext context, String phoneNumber)async{
    try{
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(e.message??'An error occurred')));

        },


        codeSent: (String verificationId, int? resendToken){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
          VerifyOtpPage(phoneNumber: phoneNumber,verificationId: verificationId)));

        },


        codeAutoRetrievalTimeout: (String verificationId){
          
        },
        timeout: const Duration(seconds: 60),


      );
    } on FirebaseAuthException catch(e)
    {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(e.message??'An error occurred')));
    }
    catch(e)
    {
      print(e);
    }
    finally{

    }
   
  } 

  static Future<void> verifyOtp(BuildContext context, String verificationId, String smscode) async{
    try{
      final credential=PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smscode);
      await _auth.signInWithCredential(credential);
      Navigator.of(context)
      .push(MaterialPageRoute(builder: (context)=>const Homepage()));

    }
    on FirebaseAuthException catch(e)
    {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(e.message??'An error occurred')));
    }
    catch(e)
    {
      print(e);
    }
    finally{

    }
  }
}

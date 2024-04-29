import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/login/loginAccount.dart';

class accountCreated extends StatefulWidget {
  const accountCreated({super.key});

  @override
  State<accountCreated> createState() => _accountCreatedState();
}

class _accountCreatedState extends State<accountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
         //mainAxisAlignment: MainAxisAlignment.center,
         //crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          SizedBox(height: 90.0,),
          Image.asset('assets/image/image_successful1.png', width: 100.0,height: 100.0,
          ),
      
          SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text('Your account was successfully created!', style: heading1,textAlign: TextAlign.center,),
          ),
          SizedBox(height: 10.0,),
          Text('Only one click to explore online education.', style: textBlack,textAlign: TextAlign.center,),
      
          //button 
      
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width:360, height:60,
                      child: FilledButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => loginAccount(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states){
                              if(states.contains(MaterialState.disabled)){
                                return primaryPurple.shade100;
                              }
                                 return primaryPurple.shade400;
                            },
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            ),
                        ),
                        
                        child: Text('Log in', 
                        textAlign: TextAlign.center,
                        style: fontWhite)
                        ),
                    ),
                ],
              ),
      
               const Spacer(),
               const TermAndPolicyText(),
              
         ],
        ),
      ),



    );
  }
}
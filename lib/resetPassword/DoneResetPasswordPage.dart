import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/login/loginAccount.dart';

class DoneResetPasswordPage extends StatefulWidget {
  const DoneResetPasswordPage({super.key, required this.email});
  final String email;

  @override
  State<DoneResetPasswordPage> createState() => _DoneResetPasswordPageState();
}

class _DoneResetPasswordPageState extends State<DoneResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    
    String email = widget.email;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reset Password', 
        style: heading1,),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/image/emailReceivedPicture.png', width: 120.0, height: 120.0,
                         ),   
                ),
               
            Text('We have sent a email',
            style: textBlack,
            textAlign: TextAlign.center,
            ),

            Text('to $email with instructions',
            style: textBlack,
            textAlign: TextAlign.center,
            ),

            Text('to reset your password',
            style: textBlack,
            textAlign: TextAlign.center,
            
            ),

            const SizedBox(height: 15.0),

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
                        
                        child: Text('Back to login', 
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
      
        ],
    
      ),

    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/signUp/verifyEmail.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class createEmail extends StatefulWidget {
  const createEmail({super.key});

  @override
  State<createEmail> createState() => _createEmailState();
}

class _createEmailState extends State<createEmail> {

  bool _isEmailValid = false;
  TextEditingController emailController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('1/3',
          style: heading4, 
          ),
          ),
          
      
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
          const Center(
            child: SizedBox(
              width: 100,
              child: StepProgressIndicator(
                totalSteps: 3,
                currentStep: 1,
                size: 4.0,
                padding: 5,
                roundedEdges: Radius.circular(5),
                selectedColor: Color(0xffcfb0f0),
                unselectedColor: Color(0xffedecef),
                ),
            ),
          ), 
        
          const SizedBox(height: 15),
        
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Email',
                    style: fontBlack,
                    ),
                  ],
                ),
        
                //textbox
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 15.0, top: 10.0,
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        _isEmailValid = isValidEmail(value);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(16.0),
                      
                      hintText: 'example@example', 
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    ),
                  ),
        
        
                const SizedBox(height: 5.0),
        
        
                //button need to set as disabled before default
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
             //SizedBox //width:360, height:60, //adjust the size according the size of text field
                        child: FilledButton(
                          onPressed: _isEmailValid?(){
                            String enteredEmail = emailController.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VerifyEmail(email:enteredEmail),
                              ),
                            );
                            
                          }:null,
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
                                borderRadius: BorderRadius.circular(13.0)
                              ),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size.fromHeight(60.0),
                              ),
                          ),
                          
                          child: Text('Create an account', 
                          textAlign: TextAlign.center,
                          style: fontWhite),
                          ),
                      ),
                  ],
                ),
        
              ],
            ),
          ),
        const Spacer(),
        const TermAndPolicyText(),
          ],
        ) ,
      
      ),
    );

   
  }

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

   bool isValidEmail (String email){
      final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return emailRegex.hasMatch(email);
  }
}
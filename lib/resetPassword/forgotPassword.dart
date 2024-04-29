import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/resetPassword/DoneResetPasswordPage.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {

  bool _isEmailValid = false;
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Reset password', 
          style: heading1,),
        ),
      
      
        body: Column(
          children: [
             const SizedBox(height: 15),
      
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('We will email you',
                      textAlign: TextAlign.center, 
                      style: fontBlack,
                      ),
                      Text('a link to reset your password',
                      textAlign: TextAlign.center, 
                      style: fontBlack,
                      ),
                    ],
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Email',
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
        
        
                //button need to set as disabled before default
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        //width:360, height:60,
                        child: FilledButton(
                          onPressed: _isEmailValid?() async {
                            String enteredEmail = emailController.text;
                            if (_isLoading) return;
                            setState(()=> _isLoading = true);
                            await Future.delayed(Duration(seconds:1));
                            
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DoneResetPasswordPage(email:enteredEmail),
                              ),
                            );

                            setState(() => _isLoading = false);

                          }:null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states){
                                if(states.contains(MaterialState.disabled)){
                                  return primaryPurple.shade100;
                                }
                                if(_isLoading){
                                  return primaryPurple.shade100;
                                }
                                  return primaryPurple.shade400;
                              },
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)
                              ),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size.fromHeight(60.0),
                              ),
                          ),
                          
                          child: Stack(
                            children: [
                              Visibility(
                                visible: !_isLoading,
                                child: Center(
                                  child: Text('Send', 
                                  textAlign: TextAlign.center,
                                  style: fontWhite),
                                ),
                              ),

                              Visibility(
                                visible: _isLoading,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 15.0,
                                      width: 15.0,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.0,
                                      ),
                                    ),
                                    SizedBox(width: 15.0),
                                    Text('Send', style: fontWhite),

                                  ],),
                                  ),
                            ],
                          ),


                          ),
                      ),
                  ],
                ),
                
        
        
              ],
            ),
          ),
          const Spacer(),
          /*Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              Text('By using Classroom, you agree to the Terms and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: textBlack,
                  ),
                ],
              ),
            ),*/
            const TermAndPolicyText(),
      
          ],
        ),
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
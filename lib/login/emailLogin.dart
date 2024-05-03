

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/resetPassword/forgotPassword.dart';
import 'package:flutter_application_1/pages/homePage.dart';

class emailLogin extends StatefulWidget {
  const emailLogin({super.key});

  @override
  State<emailLogin> createState() => _emailLoginState();
}

class _emailLoginState extends State<emailLogin> {

  bool _isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isLoading = false;
  

  @override
  Widget build(BuildContext context) {
   
    
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Log into account', 
          style:heading1),      
        ),
      
        body: Column(
          children: [
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
        
                //textfield for email
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 18.0, top: 10.0,
                    ),
                  child: TextFormField(
                    onChanged: (value){
                      setState(() {
                        _isEmailValid = isValidEmail(value);
                      });
                    },
                    /*validator: (value){
                      //edit the validation of email created
                      //show dialog
                    },*/
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
              
                  Row(
                    children: [
                      Text('Password',
                         style: fontBlack,
                      ),
                    ],
                  ),
              
                  //text field for password
                  Padding(
                        padding: EdgeInsets.only(
                           bottom: 15.0, top: 10.0,
                        ),
                        child: TextFormField(
                          onChanged: (passwordFilled){
                            setState(() {
                              _isPasswordValid = isValidPassword(passwordFilled);
                            });
                          },
                          /*validator: (value){
                            //edit the validation of password created
                            //show dialog
                          },*/
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                            },
                            icon: _isVisible? Icon(Icons.visibility): Icon(Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(16.0),
                            
                            hintText: 'Enter password', 
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
                          onPressed: 
                          _isEmailValid && _isPasswordValid ? () async {
                            if (_isLoading) return;
                            
                            setState(() => _isLoading = true);
                            await Future.delayed(Duration(seconds: 1));
                           
                              
                            //String enteredEmail = emailController.text;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => homePage(),
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
                                  child: Text('Log in', 
                                    textAlign: TextAlign.center,
                                    style: fontWhite,
                                    ),
                                
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
                                        color: Colors.white,strokeWidth: 2.0,),
                                    ),
                                      const SizedBox(width: 15.0),
                                      Text('Log in',style: fontWhite),
                                  ],
                                ),
                                    ),
                            ],
                          ),
                          
                          ),
                      ),
                  ],
                ),
              
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => forgotPassword(),
                        ),
                    );
                    }, 
                    child: Text('Forgot password?',
                    style: TextStyle(color: Colors.black),
                    ),
                  ),
              
                   
                 
              ],
            ),
          ),
            const Spacer(),
            const TermAndPolicyText(),
                   
        ],
        
        ),
      
      ),
    );
  }

  bool isValidEmail (String email){
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    //need to match the email created in the system, then email valid
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword (String password){
    final RegExp passwordRegex = RegExp(r'(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>/\-;_=+~])(?=.*[a-zA-Z])');
    
    //need to match the password created in the system
    return passwordRegex.hasMatch(password); 
  }

}
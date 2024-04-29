import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/signUp/accountCreated.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class createPassword extends StatefulWidget {
  const createPassword({super.key});

  @override
  State<createPassword> createState() => _createPasswordState();
}

class _createPasswordState extends State<createPassword> {

  TextEditingController passwordController = TextEditingController();
  bool _isVisible = false;
  bool _isPasswordMinEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneSymbol = false;
  
  double pass_strength =0;
  //final numericRegex = RegExp(r'[0-9]');
  //final symbolRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>/\;"_=+~])');
  //final passwordValid = RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>/\-;_=+~])(?=.*[a-zA-Z]).{8,}');
  bool _isPasswordValid = false;

  void onPasswordChanged(String password){
    final numericRegex = RegExp(r'[0-9]');
    final symbolRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{`}|<>/\;"_=+~])');
    setState(() {
      
      _isPasswordMinEightCharacters = false;
      if(password.length>=8){
        _isPasswordMinEightCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password)){
        _hasPasswordOneNumber = true;
      }

      _hasPasswordOneSymbol = false;
      if(symbolRegex.hasMatch(password)){
        _hasPasswordOneSymbol = true;
      }
      
      /*if (password.length >= 8){
        _isPasswordMinEightCharacters = true;
      }else{
        _isPasswordMinEightCharacters = false;
      }
      
      if (numericRegex.hasMatch(password)){
        _hasPasswordOneNumber = true;
      }else{
        _hasPasswordOneNumber = false;
      }
   
      if (symbolRegex.hasMatch(password)){
        _hasPasswordOneSymbol = true;
      } else{
      _hasPasswordOneSymbol = false; 
      }*/
      
    });
     _validatePassword(password);
  }

 void _validatePassword(String pass){
  final passwordValid = RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>/\-;_=+~])(?=.*[a-zA-Z]).{8,}$');
   
    String password = pass.trim();
    /*if(password.isEmpty){
      setState(() {
        pass_strength <1/3;
      });
    }else if(password.length<8){
      setState(() {
        pass_strength = 1/3;
      });
    }else if(numericRegex.hasMatch(password) || (symbolRegex.hasMatch(password))){
      setState(() {
        pass_strength = 2/3;
      });
    }else if(passwordValid.hasMatch(password)){
      setState(() {
        pass_strength = 1;
      });
    }else{
      setState(() {
        pass_strength=0;
      });
    }*/

    setState(() {
    if (password.isEmpty) {
      pass_strength = 0;
      _isPasswordValid =false;
    } else if (passwordValid.hasMatch(password)) {
      pass_strength = 1;
      _isPasswordValid = true;
    } else if (password.length < 8 || (!_hasPasswordOneNumber && !_hasPasswordOneSymbol)) {
      pass_strength = 1 / 3;
      _isPasswordValid =false;
    } else if (_isPasswordMinEightCharacters && (_hasPasswordOneNumber || _hasPasswordOneSymbol)) {
      pass_strength = 2 / 3;
      _isPasswordValid =false;
    } else {
      pass_strength = 0;
      _isPasswordValid =false;
    }
  });
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('3/3',
          style: heading4,
          ),
          ),
      
        body: Column(
          children: [
            const Center(
                child: SizedBox(
                  width: 100,
                  child: StepProgressIndicator(
                    totalSteps: 3,
                    currentStep: 3,
                    size: 4.0,
                    padding: 5,
                    roundedEdges: Radius.circular(5),
                    selectedColor: Color(0xffcfb0f0),
                    unselectedColor: Color(0xffedecef),
                    ),
                ),
              ),
      
              const SizedBox(height: 10.0),
      
              //password part
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Row(
                        children: [
                          Text('Password',
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
                          onChanged: (password) => 
                           
                            onPasswordChanged(password),
                          
                          
      
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
      
                        const SizedBox(height: 5.0),
      
                       //password strength bar
                       LinearProgressIndicator(
                        value: pass_strength,
                        backgroundColor: Colors.grey[300],
                        minHeight: 7,
                        color: pass_strength == 1 / 3 ? Color(0xffd62c01) 
                        : pass_strength == 2 / 3 ? Color(0xfffaae16) 
                        : pass_strength == 1 ? Color(0xff498200)
                        : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.0),
                        
                        /*pass_strength <1/3 && _isPasswordMinEightCharacters? Colors.grey 
                        : pass_strength == 1/3 ? Colors.red 
                        : pass_strength == 2/3? Colors.amber 
                        : pass_strength == 1? Colors.green 
                        :Colors.grey,*/
                       ),
      
      
      
                       //3 requirements of creating password
                       const SizedBox(height: 10.0),
                       Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: _isPasswordMinEightCharacters ? Color(0xff498200) : Colors.transparent,
                              border: _isPasswordMinEightCharacters ? 
                              Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('8 characters minimum', style: textBlack,),
                        ],
                       ),
      
                       const SizedBox(height: 10.0),
                       Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: _hasPasswordOneNumber? Color(0xff498200) : Colors.transparent,
                              border: _hasPasswordOneNumber? 
                              Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('a number', style: textBlack,),
                        ],
                       ),
      
                       const SizedBox(height: 10.0),
                       Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: _hasPasswordOneSymbol? Color(0xff498200) : Colors.transparent,
                              border: _hasPasswordOneSymbol?
                              Border.all(color: Colors.transparent) : Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('a symbol', style: textBlack,),
                        ],
                       ),
      
                       const SizedBox(height: 20.0),
      
                       //button
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            //width:360, height:60,
                            child: FilledButton(
                            onPressed: _isPasswordValid?(){
                  
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => accountCreated(),
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
                                      borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    ),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      Size.fromHeight(60.0),
                                    ),
                                ),
                                
                                child: Text('Continue', 
                                textAlign: TextAlign.center,
                                style: fontWhite)
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
            ),
      ),
    );
      
  }


}


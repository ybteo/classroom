import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/signUp/createPassword.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class VerifyEmail extends StatefulWidget {
  final String email;

  const VerifyEmail({super.key, required this.email});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}



class _VerifyEmailState extends State<VerifyEmail> {

  bool _isCodeValid = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = widget.email;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('2/3',
        style: heading4,
        ),
        ),
        

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
        Text('Verify your email', style: heading1),
        const SizedBox(height: 10.0),
        const Center(
          child: SizedBox(
            width: 100,
            child: StepProgressIndicator(
              totalSteps: 3,
              currentStep: 2,
              size: 4.0,
              padding: 5,
              roundedEdges: Radius.circular(5),
              selectedColor: Color(0xffcfb0f0),
              unselectedColor: Color(0xffedecef),
              ),
          ),
        ),  
        const SizedBox(height: 15.0),
        
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('We just sent 5-digit code to $email, enter it below:',
          textAlign: TextAlign.center,
          style: fontBlack,
          ),
          ),
        
      
        const SizedBox(height: 10.0),
      
        Padding(
          padding: EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Row(
                children: [
                  Text('Code',
                  style: fontBlack,
                  ),
                ],
              ),
      
              const SizedBox(height: 5.0),
      
              Column(
                children: [
                  PinCodeTextField(
                    
                    appContext: context,
                    controller: controller,
                    length: 5,
                    cursorHeight: 19,
                    enableActiveFill: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldWidth: 70,
                      inactiveColor: Colors.grey[350],
                      selectedColor: primaryPurple.shade400,
                      activeColor: Colors.grey[400],
                      selectedFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      activeFillColor: Colors.transparent,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onChanged: ((value){
                    setState(() {
                      _isCodeValid = isValidCode(value);
                    });
                  
                      print(value);
                      //validate function here
                    }
                    ),
                  ),
                  
                ],
              ),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      //width:360, height:60,
                      child: FilledButton(
                        onPressed: _isCodeValid?(){
                
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => createPassword(),
                            ),
                          );
                        }: null,
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
                        
                        child: Text('Verify email', 
                        textAlign: TextAlign.center,
                        style: fontWhite)
                        ),
                    ),
                ],
              ),
      
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Wrong email?', style: textBlack,
                    ),
                        
                    TextButton(
                      onPressed: (){}, //navigate to other page
                      child: Text('Send to different email',
                      style: heading2,
                      ),
                    ),
                  ],
                ),
              ),
            
      
          ],
          ),
          ),
      
            const Spacer(),
            const TermAndPolicyText(),
   
        ],
          ),
    );
  }

bool isValidCode(String code) {
  return code.length == 5; // Assuming the code should be exactly 5 digits
}

}
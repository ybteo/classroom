import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/text_style.dart';

class TermAndPolicyText extends StatelessWidget {
  const TermAndPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(45.0),
      child: Column( 
        mainAxisAlignment:MainAxisAlignment.end,
        children: [

          

         RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: textBlack,
            children: [
              TextSpan(
                text: 'By using Classroom, you agree to the', style: textBlack),
              TextSpan(text: ' \nTerms', style: heading2),
              TextSpan(text: ' and',style: textBlack),
              TextSpan(text: ' Privacy Policy.', style: heading2),
            ],
          ),
          ),

      ],
      ),
    
    );



  }
}
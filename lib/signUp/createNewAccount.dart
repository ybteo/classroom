import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/signUp/createEmail.dart';

class createNewAccount extends StatefulWidget {
  const createNewAccount({super.key});

  @override
  State<createNewAccount> createState() => _createNewAccountState();
}

class _createNewAccountState extends State<createNewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create new account', 
        style: heading1,
        ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [

              const SizedBox(height: 15),

              Text('Begin with creating new free account. This helps you keep your learning way easier.',
              textAlign: TextAlign.center, 
              style: fontBlack,
              ),

              const SizedBox(height: 25),

              SizedBox(
                  width:380, height:60,
                  child: FilledButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => createEmail(),
                        ),
                      );
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => primaryPurple.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        ),
                    ),
                    
                    child: Text('Continue with email', 
                    textAlign: TextAlign.center,
                    style: fontWhite,
                    )
                    ),
                ),

                const SizedBox(height: 25),

                Text('or', style: fontBlack,),

                const SizedBox(height: 25),

                SizedBox(
                  width:380, height:60,
                  child: OutlinedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xffc7c5cc)),
                        ),
                        ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/image/logo/appleLogo.png', height: 20,),
                        SizedBox(width: 8),
                        Text('Continue with Apple',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                    ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width:380, height:60,
                  child: OutlinedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xffc7c5cc)),
                        ),
                        ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/image/logo/fbLogo.png', height: 18,),
                        SizedBox(width: 8),
                        Text('Continue with Facebook',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                    ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width:380, height:60,
                  child: OutlinedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black26),
                        ),
                        ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/image/logo/googleLogo.png', height: 16,),
                        SizedBox(width: 8),
                        Text('Continue with Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                    ),
                ),

                Spacer(),

                TermAndPolicyText(),
            ],
          
          ),
        ),
    );
  }
}
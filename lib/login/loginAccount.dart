/*import 'package:face_authenticator/face_authenticator.dart';
import 'package:face_authenticator/result/face_authenticator_failure.dart';
import 'package:face_authenticator/result/face_authenticator_result.dart';
import 'package:face_authenticator/result/face_authenticator_success.dart';*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/const/TermAndConditions.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';
import 'package:flutter_application_1/login/emailLogin.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/homePage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_platform_interface/local_auth_platform_interface.dart';
import 'package:local_auth_platform_interface/types/biometric_type.dart';

class loginAccount extends StatefulWidget {
  const loginAccount({super.key});

  @override
  State<loginAccount> createState() => _loginAccountState();
}

class _loginAccountState extends State<loginAccount> {

  late final LocalAuthentication auth;
  bool _supportState = false;
  bool? _canCheckBiometrics;
  final MethodChannel _channel = MethodChannel('android_faceID');
  bool faceAuthenticated = false;
  bool fingerprintAuthenticated = false;
  List<BiometricType> _availableBiometrics = [];
  
  TextEditingController emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
      (bool isSupported) => setState(() {
        _supportState = isSupported;
      }),
      );
      _getAvailableBiometrics();

  }


  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      leading: TextButton(
      onPressed: () {
        Navigator.push(
          context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'title'),
        ),
        );
      },
      child: Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: Text(
        'Log into account',
        style: heading1,
      ),
    ),


        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [

              const SizedBox(height: 10),

              Text('Welcome back!',
              textAlign: TextAlign.center, 
              style: fontBlack,
              ),

              const SizedBox(height: 5),

              Text('Let\'s continue learning',
              textAlign: TextAlign.center, 
              style: fontBlack,
              ),

              const SizedBox(height: 20),

              SizedBox(
                  width:380, height:60,
                  child: FilledButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => emailLogin(),
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

                const SizedBox(height: 20),

                Text('or', style: fontBlack,),

                const SizedBox(height: 20),

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

                const SizedBox(height: 30.0),
                const Text('Log in with Fingerprint or Face ID:'),
                const SizedBox(height: 10.0),

                GestureDetector(
                  onTap: _authenticate,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image(image: AssetImage('assets/image/logo/fingerprint.png'), width: 40.0,height: 40.0),
 
                      SizedBox(width: 30.0),

                      Image(image: AssetImage('assets/image/logo/face_id.png'), width: 40.0,height: 40.0),
                          
                          /*IconButton(
                            onPressed: _authenticate, 
                            icon: Image.asset('assets/image/logo/fingerprint.png', 
                            width: 40.0, height:40.0),
                            iconSize: 5.0,
                            ),*/
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

  Future <void> _authenticate() async {
   try{
      bool authenticated = await auth.authenticate(
        localizedReason: 'Choose a biometric method for authentication.',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
          biometricOnly: true,
        ),
        );
        if (authenticated){
          
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context)=> homePage()),
              );
        }
        print("Authenticated: $authenticated ");
    }on PlatformException catch (e){
      print(e);
    }
  }

 /* Future <void> _authenticateWithFaceID() async {
    final canCheck =  await auth.canCheckBiometrics;

    if(canCheck){
      List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

      if(availableBiometrics.contains(BiometricType.face)){
        faceAuthenticated = await auth.authenticate(
          localizedReason: 'Scan your face for authentication.',
          options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
          biometricOnly: true,
        ),
          );
          if (faceAuthenticated){
          
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context)=> homePage()),
              );
        }
      }else{
        print('can\'t check');
      }
       
       
    }
    try{
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your face for authentication.',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
          biometricOnly: true,
        ),
        );
        if (authenticated){
          
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context)=> homePage()),
              );
        }
        print("Authenticated: $authenticated ");
    }on PlatformException catch (e){
      print(e);
    }
  }*/


  
  

  Future<void>_getAvailableBiometrics() async {
    List<BiometricType>availableBiometrics =
    await auth.getAvailableBiometrics();
    print("List of available Biometrics : $availableBiometrics");

    if(!mounted){
      return;
    }
  }

  Future<void> _checkBiometrics() async {
    late bool deviceSupportsBiometrics;
    try{
      deviceSupportsBiometrics = 
        await LocalAuthPlatform.instance.deviceSupportsBiometrics();
    }on PlatformException catch (e){
      deviceSupportsBiometrics =false;
      print(e);
    }
    if (!mounted){
      return;
    }

    setState(() {
      _canCheckBiometrics = deviceSupportsBiometrics;
    });
  }


}



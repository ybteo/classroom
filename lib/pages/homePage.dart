import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/constant.dart';
import 'package:flutter_application_1/const/text_style.dart';

class homePage extends StatefulWidget {
  
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  
  @override
  Widget build(BuildContext context) {
    //String email = widget.email;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page',
        style: heading1,
        ),
      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: primaryPurple.shade100,
                    backgroundImage: AssetImage('assets/image/profile_pic.png'),
                    child: Container(
                      width: double.infinity,height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/image/profile_pic.png'),
                        fit: BoxFit.cover,
                        )
                      ),
                      ),
              
                  ),
              
                  const SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Text('User #12345', style: heading1),
                      
                      Text('example@example',style: heading3),
                    ],
                  ),
                ],
              ),
                  const SizedBox(height: 25.0),
              
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.assignment_outlined, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('My Orders', style: textBlack),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite_border_outlined, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('My Wishlist', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                       const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('Shipping Address', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.payment_outlined, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('Payment Method', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.star_border_outlined, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('Reviews', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.help_outline_outlined, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('Help', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.info_outline, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('About', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                       Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                  (Set<MaterialState> states){
                                      if(states.contains(MaterialState.disabled)){
                                        return primaryPurple.shade300;
                                      }
                                         return primaryPurple.shade200;
                                    }, ),
                              
                              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromHeight(60.0),
                                      //const Size.fromWidth(70.0),
                                    ),),
                              child: Row(
                                children: [
                                  Icon(Icons.settings, color: primaryPurple.shade400, size: 25.0),
                                  const SizedBox(width: 15.0),
                                  Text('Setting', style: textBlack),
                                  const Spacer(),
                                  Icon(Icons.arrow_forward_ios, color: primaryPurple.shade400, size: 25.0),
                                ],
                              ),
                              ),
                          ),
                        ],
                      ),


                    ],
                  ),
              
              
              
              
              
              
              
            ],
          ),
        ),
      ),

    );
  }
}
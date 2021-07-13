
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {



 final bool gender ;

 final int age;

 final int result ;

  ResultScreen({required this.gender, required this.age, required this.result,});



 String interpretBMI() {

   String interpretation;

   if (result < 18.5) {
     interpretation = "You are underweight";
     Text(interpretation,style: TextStyle(color: Colors.yellow),);

   } else if (result < 25) {
     interpretation = "You are normal. Excellent.";
     Text(interpretation,style: TextStyle(color: Colors.blue,fontSize: 40),);

   } else if (result < 30) {
     interpretation = "You are overweight.";
     Text(interpretation,style: TextStyle(color: Colors.red),);

   } else if (result < 40) {
     interpretation = "You are obese. You have to exercise more.";
     Text(interpretation,style: TextStyle(color: Colors.red),);

   } else {
     interpretation = "You have severe obesity";
     Text(interpretation,style: TextStyle(color: Colors.red),);

   }
   return interpretation;
 }

 String getResult() {
    if (result >= 25) {
     return 'Overweight';
   } else if (result > 18.5) {
     return 'Normal';
   } else {
     return 'Underweight';
   }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Result'),

      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text('Your result',style: TextStyle(fontSize: 40),),

            SizedBox(
              height: 20,
            ),

            Card(

              color: Colors.white,

              elevation: 5,

              semanticContainer: false ,


              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: SizedBox(
                height: MediaQuery.of(context).size.height *0.6,
                width: double.infinity,
                child: Column(


                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                  children: [

                    Text("${getResult()}",style: TextStyle(fontSize: 23,

                        color:getResult() == 'Overweight'? Colors.red : getResult() == 'Underweight'?  Colors.yellow : Colors.green ),



                    ),


                    Text('$result',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),


                    SizedBox(
                      width: 250,
                        child: Text("${interpretBMI()}",
                          maxLines: 2,
                          textScaleFactor: 1.0,
                          style: TextStyle(fontSize: 20,),overflow: TextOverflow.clip,)),
                  ],

                ),
              ),

            ),

          ],

        ),
      ),

    );
  }
}

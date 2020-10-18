import 'package:flutter/material.dart';
import 'family_portal.dart';


void main() => runApp(HomePage());
class HomePage extends StatelessWidget {



  goToFamilyPortal(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => FamilyHomePage()));
  }
//  goToPatientPortal(BuildContext context) {
//    Navigator.push(context, MaterialPageRoute(
//      builder: (context) => PatientHomePage()));
// }

  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Home Page',
     home: Scaffold(
       appBar: AppBar(
         title: Text('Welcome',
         ),
       ),
       body: new Center(
         child: new Column(crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[new Text('Welcome! Who is using Sparky today?',
           textAlign: TextAlign.center),
           SizedBox(
             height: 35.0,
           ),
           // Patient Button
           new ElevatedButton(
               onPressed: () {/*goToPatientPortal(context);*/}, // TODO
               style: ButtonStyle(
                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                 ),
               child: Text('*PatientName*',
                  textAlign: TextAlign.center,)
            ),
             SizedBox(
               height: 10.0,
             ),
             // Family Button
         new ElevatedButton(
             onPressed: () {goToFamilyPortal(context);}, // TODO
             style: ButtonStyle(
               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
               backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
             ),
             child: Text('A family member of *PatientName*',
               textAlign: TextAlign.center,)
         ),
           ],
         ),
       ),
     ),
   );

 }


}

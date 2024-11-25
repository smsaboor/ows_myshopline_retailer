// import 'package:flutter/material.dart';
//
// class ButtonContactType extends StatefulWidget {
//   const ButtonContactType({Key? key,this.selectedIndex}) : super(key: key);
// final selectedIndex;
// final title1;
//   @override
//   State<ButtonContactType> createState() => _ButtonContactTypeState();
// }
//
// class _ButtonContactTypeState extends State<ButtonContactType> {
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       width: MediaQuery.of(context).size.width*.4,
//       child: Card(
//         elevation: 10,
//         color:  selectedIndex==4?Colors.green:Colors.black38,
//         shape: const RoundedRectangleBorder(
//           borderRadius:
//           BorderRadius.all(Radius.circular(10)),
//           side: BorderSide(color: Colors.white),
//         ),
//         child: InkWell(
//           onTap: (){
//             if(mounted){
//               setState((){
//                 selectedIndex=4;
//               });
//             }
//           },
//           child: Row(
//             children: [
//               Checkbox(
//                 value: selectedIndex==4?true:false,
//                 checkColor: Colors.black,
//                 activeColor: Colors.white,
//                 onChanged: (bool? value) {
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Column(
//                   children: [
//                     const Text("App"),
//                     const Text("Messages"),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

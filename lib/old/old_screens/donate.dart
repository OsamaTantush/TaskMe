// import 'package:flutter/material.dart';
// import 'package:todo_app/models/slide_menu.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/models/donationData.dart';
// import 'package:flutter/services.dart';
//
// class Donate extends StatefulWidget{
//   @override
//   _Donate createState() => _Donate();
// }
//
// class _Donate extends State<Donate>{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 3,
//         backgroundColor: Colors.yellow,
//         foregroundColor: Color(0xff211825),
//         title: Row(
//           children: [
//             Text(
//               'Donate',
//               style: TextStyle(
//                   color: Color(0xff211825),
//                   fontSize: 30,
//                   letterSpacing: 1,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//             SizedBox(width: 8),
//             Icon(
//               Icons.emoji_food_beverage_outlined,
//               size: 28,
//               color: Color(0xff211825),
//             ),
//           ],
//         ),
//         centerTitle: false,
//         leading: Builder(
//           builder: (context){
//             return IconButton(
//               icon: Icon(Icons.list, size: 30,),
//               color: Color(0xff211825),
//               onPressed: (){
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       drawer: SlideMenu(),
//       body: Padding(
//         padding: const EdgeInsets.only(left:10, right:10),
//         child: Body(),
//       ),
//     );
//   }
// }
//
// class Body extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Support us',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 0,
//               ),
//             ),
//             SizedBox(width: 12,),
//             Icon(
//               FontAwesomeIcons.solidHeart, size: 28, color: Colors.red[800],
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//           child: Divider(color: Colors.black,),
//         ),
//         SizedBox(height: 12,),
//         Text(
//           'Your kind donations will help us make updates and brings more free features.',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 18,
//             letterSpacing: 0,
//           ),
//         ),
//         SizedBox(height: 48,),
//         Text(
//           'Choose a method : ',
//           style: TextStyle(
//             fontSize: 18,
//             color: Color(0xff211825),
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0,
//           ),
//         ),
//         SizedBox(height: 14,),
//         Consumer<DonationData>(
//           builder: (context, donationData, child){
//             return ListTile(
//               horizontalTitleGap: 0,
//               title: Text(
//                 'Credit Card',
//                 style: TextStyle(fontSize:16, color:(donationData.bCreditCard)?Color(0xff211825):Colors.grey),
//               ),
//               leading: IconButton(
//                 alignment: Alignment.center,
//                 icon: (donationData.bCreditCard)?
//                   Icon(Icons.radio_button_checked, color:Color(0xff211825)):
//                   Icon(Icons.radio_button_off, color:Colors.grey),
//                 onPressed: (){donationData.updatePaymentMethod(creditCard: true, crypto: false);},
//               ),
//               trailing: Icon(Icons.credit_card, color: (donationData.bCreditCard)?Color(0xff211825):Colors.grey),
//             );
//           }
//         ),
//         Consumer<DonationData>(
//           builder: (context, donationData, child){
//             return ListTile(
//               horizontalTitleGap: 0,
//               title: Text(
//                 'Via Cryptocurrency',
//                 style: TextStyle(fontSize:16, color: (donationData.bCrypto)?Color(0xff211825):Colors.grey),
//               ),
//               leading: IconButton(
//                 alignment: Alignment.center,
//                 icon: (donationData.bCrypto)?
//                   Icon(Icons.radio_button_checked, color:Color(0xff211825)):
//                   Icon(Icons.radio_button_off, color:Colors.grey),
//                 onPressed: (){donationData.updatePaymentMethod(crypto: true, creditCard: false);},
//               ),
//               trailing: Icon(FontAwesomeIcons.btc, color: (donationData.bCrypto)?Color(0xff211825):Colors.grey),
//             );
//           }
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
//           child: TextButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Color(0xff211825)),
//               shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))),
//               padding: MaterialStateProperty.all(EdgeInsets.all(16)),
//             ),
//             child: Text('Proceed', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
//             onPressed: () {
//               showModalBottomSheet(
//                 backgroundColor: Colors.white.withOpacity(0),
//                 isScrollControlled: true,
//                 context: context,
//                 builder: (context) { return BottomSheet(); }
//               );
//             }
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class BottomSheet extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height*0.42,
//       padding: const EdgeInsets.only(left: 24, top: 32, right: 24, bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Consumer<DonationData>(
//         builder: (context, donationData, child){
//           return (donationData.bCreditCard)?
//           //CreditCard
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 4),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Donate Using CreditCard _',
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff211825)),
//                     ),
//                     SizedBox(width: 16),
//                     CircleAvatar(
//                       radius: 18,
//                       backgroundColor: Colors.red[800],
//                       child: IconButton(
//                         icon: Icon(Icons.close, color: Colors.yellow, size: 18,),
//                         onPressed: () {Navigator.pop(context);}
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Not available yet.',
//                     style: TextStyle(color: Colors.red[800], fontSize: 28, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ):
//           //Crypto
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Donate via crypto _',
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff211825)),
//                     ),
//                     SizedBox(width: 28),
//                     CircleAvatar(
//                       radius: 24,
//                       backgroundColor: Color(0xff211825),
//                       child: IconButton(
//                         icon: Icon(Icons.copy_outlined, color: Colors.yellow, size: 24,),
//                         onPressed: () {
//                           Clipboard.setData(ClipboardData(text: donationData.networkAddress)).then((_) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Copied to your clipboard!'),
//                                 behavior: SnackBarBehavior.fixed,
//                               ),
//                             );
//                           });
//                           Navigator.pop(context);
//                         }
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 12),
//               Row(
//                 children: [
//                   Text('Select coin'),
//                   SizedBox(width: 12),
//                   DropdownButton(
//                     elevation: 3,
//                     value: donationData.activeCurrency,
//                     items: donationData.currencyMap.keys.map((currency) {
//                       return DropdownMenuItem(
//                         value: currency,
//                         child: Text(currency),
//                       );
//                     }).toList(),
//                     onChanged: (value){
//                       donationData.updateActiveCurrency(value);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(width: 12),
//               Row(
//                 children: [
//                   Text('Network'),
//                   SizedBox(width: 12),
//                   DropdownButton(
//                     elevation: 3,
//                     value: donationData.activeNetwork,
//                     items: donationData.currencyMap[donationData.activeCurrency].keys.
//                     map((currency) {
//                       return DropdownMenuItem(
//                         value: currency,
//                         child: Text(currency),
//                       );
//                     }).toList(),
//                     onChanged: (value){
//                       donationData.updateActiveNetwork(value);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               Expanded(
//                 child: Container(
//                   height: 50,
//                   color: Color(0xff211825).withOpacity(0.85),
//                   padding: EdgeInsets.all(4),
//                   alignment: Alignment.center,
//                   child: Text(
//                     donationData.networkAddress,
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }
//       ),
//     );
//   }
// }

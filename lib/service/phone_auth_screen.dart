// // lib/views/phone_auth_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class PhoneAuthScreen extends StatefulWidget {
//   @override
//   _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
// }
//
// class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   String? _verificationId;
//
//   Future<void> _verifyPhoneNumber() async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: _phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//         _saveUserInfo();
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         Get.snackbar('Error', e.message!);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//     );
//   }
//
//   Future<void> _signInWithPhoneNumber() async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId!,
//         smsCode: _otpController.text,
//       );
//       await _auth.signInWithCredential(credential);
//       _saveUserInfo();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to sign in');
//     }
//   }
//
//   Future<void> _saveUserInfo() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
//         'phone': user.phoneNumber,
//       });
//       Get.offAllNamed('/');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phone Authentication')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_verificationId == null) ...[
//               TextField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _verifyPhoneNumber,
//                 child: Text('Verify'),
//               ),
//             ] else ...[
//               PinCodeTextField(
//                 length: 6,
//                 appContext: context,
//                 controller: _otpController,
//                 onChanged: (value) {},
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _signInWithPhoneNumber,
//                 child: Text('Sign In'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

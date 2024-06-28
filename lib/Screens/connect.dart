import 'package:flutter/material.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: const EdgeInsets.all(15), // Adjust padding as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 20, // Decrease font size for title
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          const Text(
            'Feel free to contact us any time. We will \n    get back to you as soon as we can',
            style: TextStyle(fontSize: 14), // Decrease font size for description
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: 'Message',
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0B3760),
            ),
            child: const Text(
              'Send',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


// Positioned(
//   right: 0,
//   child: GestureDetector(
//     onTap: () {
//       Navigator.of(context).pop();
//     },
//     child: Align(
//       alignment: Alignment.topRight,
//       child: CircleAvatar(
//         radius: 14,
//         backgroundColor: Colors.red,
//         child: Icon(
//           Icons.close,
//           color: Colors.white,
//           size: 20,
//         ),
//       ),
//     ),
//   ),
// ),
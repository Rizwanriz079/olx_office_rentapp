import 'dart:io';
import 'package:api/Constant.dart';
import 'package:api/Screens/Chat_screen.dart';
import 'package:api/Screens/connect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/post_model.dart';
import '../Controller/post_controller.dart';
import 'Edit_adds.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity, // Take full width
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Curved edges
                  child: CarouselSlider(
                    items: post.images.map((image) {
                      if (image.startsWith('http')) {
                        // If the image is a network URL
                        return Image.network(
                          image,
                          width: double.infinity, // Take full width
                          fit: BoxFit.cover,
                        );
                      } else {
                        // If the image is a local file path
                        return Image.file(
                          File(image), // Import 'dart:io' for File
                          width: double.infinity, // Take full width
                          fit: BoxFit.cover,
                        );
                      }
                    }).toList(),
                    options: CarouselOptions(
                      pauseAutoPlayOnTouch: true,
                      autoPlay: true,
                      height: 250,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                  ),
                ),
              ),
              kheight20,
              Text(post.buildingName, style: AppTextStyles.aBeeZee20Bold),
              kheight15,
              Text(post.location, style: TextStyle(color: Colors.grey)),
              kheight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '₹${post.price.toStringAsFixed(0)} /month',
                      style: AppTextStyles.aBeeZee16Bold),
                  Text(
                      '${post.squareFeet} sqft',
                      style: AppTextStyles.aBeeZee16Bold),
                ],
              ),
              kheight5,
              Text('+ Deposit 6 months rent', style: TextStyle(color: Colors.grey)),
              kheight15,
              Text('Details',
                  style: AppTextStyles.aBeeZee16Bold),
              kheight10,
              Text(post.details, style: AppTextStyles.aBeeZee16),
              kheight15,
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: [
                      DetailItem(
                          icon: Icons.chair,
                          title: 'Number of Seats',
                          subtitle: post.numberOfSeats.toString()),
                      DetailItem(
                          icon: Icons.meeting_room,
                          title: 'No. of Cabins',
                          subtitle: '${post.numberOfCabins} '),
                      DetailItem(
                          icon: Icons.wash,
                          title: 'Washrooms',
                          subtitle: '${post.washrooms} '),
                      DetailItem(
                          icon: Icons.apartment,
                          title: 'Floors',
                          subtitle: '${post.floorNumber} '),
                      DetailItem(
                          icon: Icons.local_parking,
                          title: 'Car Parking',
                          subtitle: '${post.numberOfCarParking}'),
                      DetailItem(
                          icon: Icons.ac_unit,
                          title: 'Air Conditioner',
                          subtitle: post.airConditioner),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0B3760),
                          minimumSize: Size(160, 50)),
                      onPressed: () {
                        Get.to(ChatScreen());
                      },
                      icon: Icon(Icons.chat, color: Colors.white, size: 30),
                      label: Text('Chat', style: TextStyle(color: Colors.white))),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0B3760),
                        minimumSize: Size(160, 50)),
                    onPressed: () {
                      Get.to(ContactDialog());
                    },
                    icon: Icon(Icons.call, color: Colors.white, size: 30),
                    label: Text('Call', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(160, 50)),
                      onPressed: () {
                        Get.to(EditPostScreen(post: post));
                      },
                      icon: Icon(Icons.edit, color: Colors.white, size: 30),
                      label: Text('Edit', style: TextStyle(color: Colors.white))),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size(160, 50)),
                    onPressed: () {
                      postController.deletePost(post);
                      Get.back();
                    },
                    icon: Icon(Icons.delete, color: Colors.white, size: 30),
                    label: Text('Delete', style: TextStyle(color: Colors.white)),
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

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  DetailItem({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 40, // Adjust the width as needed
      child: Row(
        children: [
          Icon(icon, size: 30),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.aBeeZee16Bold,
                ),
                Text(subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:io';
// import 'package:api/Constant.dart';
// import 'package:api/Screens/Chat_screen.dart';
// import 'package:api/Screens/connect.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import '../models/post_model.dart';
//
// class PostDetailScreen extends StatelessWidget {
//   final Post post;
//
//   PostDetailScreen({required this.post});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity, // Take full width
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20), // Curved edges
//                   child: CarouselSlider(
//                     items: post.images.map((image) {
//                       if (image.startsWith('http')) {
//                         // If the image is a network URL
//                         return Image.network(
//                           image,
//                           width: double.infinity, // Take full width
//                           fit: BoxFit.cover,
//                         );
//                       } else {
//                         // If the image is a local file path
//                         return Image.file(
//                           File(image), // Import 'dart:io' for File
//                           width: double.infinity, // Take full width
//                           fit: BoxFit.cover,
//                         );
//                       }
//                     }).toList(),
//                     options: CarouselOptions(
//                       pauseAutoPlayOnTouch: true,
//                       autoPlay: true,
//                       height: 250,
//                       enlargeCenterPage: true,
//                       enableInfiniteScroll: false,
//                     ),
//                   ),
//                 ),
//               ),
//               kheight20,
//               Text(post.buildingName,style: AppTextStyles.aBeeZee20Bold),
//               kheight15,
//               Text(post.location,style: TextStyle(color: Colors.grey)),
//               kheight15,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '₹${post.price.toStringAsFixed(0)} /month',
//                     style: AppTextStyles.aBeeZee16Bold),
//                   Text(
//                     '${post.squareFeet} sqft',
//                     style: AppTextStyles.aBeeZee16Bold),
//                 ],
//               ),
//               kheight5,
//               Text('+ Deposit 6 months rent', style: TextStyle(color: Colors.grey)),
//               kheight15,
//               Text('Details',
//                 style: AppTextStyles.aBeeZee16Bold),
//               kheight10,
//               Text(post.details, style: AppTextStyles.aBeeZee16),
//               kheight15,
//               Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(8),
//                 child: Container(
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8)),
//                   child: Wrap(
//                     spacing: 16.0,
//                     runSpacing: 16.0,
//                     children: [
//                       DetailItem(
//                         icon: Icons.chair,
//                         title: 'Number of Seats',
//                         subtitle: post.numberOfSeats.toString()),
//                       DetailItem(
//                         icon: Icons.meeting_room,
//                         title: 'No. of Cabins',
//                         subtitle: '${post.numberOfCabins} '),
//                       DetailItem(
//                         icon: Icons.wash,
//                         title: 'Washrooms',
//                         subtitle: '${post.washrooms} '),
//                       DetailItem(
//                         icon: Icons.apartment,
//                         title: 'Floors',
//                         subtitle: '${post.floorNumber} '),
//                       DetailItem(
//                         icon: Icons.local_parking,
//                         title: 'Car Parking',
//                         subtitle: '${post.numberOfCarParking}'),
//                       DetailItem(
//                         icon: Icons.ac_unit,
//                         title: 'Air Conditioner',
//                         subtitle: post.airConditioner),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0B3760),
//                       minimumSize: Size(160, 50)),
//                     onPressed: () {
//                       Get.to(ChatScreen());
//                     },
//                     icon: Icon(Icons.chat, color: Colors.white, size: 30),
//                     label: Text('Chat', style: TextStyle(color: Colors.white))),
//                   ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF0B3760),
//                       minimumSize: Size(160, 50)),
//                     onPressed: () {
//                       Get.to(ContactDialog());
//                     },
//                     icon: Icon(Icons.call, color: Colors.white, size: 30),
//                     label: Text('Call', style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DetailItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//
//   DetailItem({required this.icon, required this.title, required this.subtitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 2 - 40, // Adjust the width as needed
//       child: Row(
//         children: [
//           Icon(icon, size: 30),
//           SizedBox(width: 8.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: AppTextStyles.aBeeZee16Bold,
//                 ),
//                 Text(subtitle),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

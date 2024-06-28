import 'package:api/Constant.dart';
import 'package:api/Screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io'; // Import for using File
import '../Controller/post_controller.dart';
import '../models/post_model.dart';
import '../widgets/bottombar.dart';
import 'CustomAppBar.dart';
import 'connect.dart';
import 'postdetail.dart';



class HomeScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "OFFICEX",
        hasSearch: true,
        onFilter: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore spaces",
                style: AppTextStyles.aBeeZee25Bold,
              ),
              kheight10,
              Container(
                height: 226,
                child: Obx(() {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: postController.posts.length,
                    itemBuilder: (context, index) {
                      final post = postController.posts[index];
                      return _buildHorizontalPostContainer(context, post);
                    },
                  );
                }),
              ),
              kheight5,
              Text("Nearby Location", style: AppTextStyles.aBeeZee25Bold),
              kheight20,
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: postController.filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = postController.filteredPosts[index];
                    return _buildVerticalPostContainer(context, post);
                  },
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildHorizontalPostContainer(BuildContext context, Post post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(PostDetailScreen(post: post));
            },
            child: Container(
              width: 180,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: _getImageProvider(
                      post.images.isNotEmpty ? post.images[0] : ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            post.buildingName,
            style: AppTextStyles.aBeeZee16Bold,
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalPostContainer(BuildContext context, Post post) {
    int price = post.price.toInt();
    return GestureDetector(
      onTap: () {
        Get.to(PostDetailScreen(post: post));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 116,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: _getImageProvider(
                        post.images.isNotEmpty ? post.images[0] : ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.buildingName,
                      style: AppTextStyles.aBeeZee16Blue,
                    ),
                    Text(
                      post.location,
                      style: AppTextStyles.aBeeZee14ItalicGrey,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "${post.squareFeet} Sqft",
                                style: AppTextStyles.aBeeZee14,
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 1,
                                height: 25,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Price: ₹$price",
                                  style: AppTextStyles.aBeeZee14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Get.dialog(ContactDialog());
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: const Color(0xFF0B3760),
                        //   ),
                        //   child: Text(
                        //     "Contact",
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0B3760),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Get.dialog(ContactDialog());
                        },
                        child: Text('Contact',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  ImageProvider _getImageProvider(String imageUrl) {
    if (Uri.tryParse(imageUrl)?.isAbsolute ?? false) {
      return NetworkImage(imageUrl);
    } else if (File(imageUrl).existsSync()) {
      return FileImage(File(imageUrl));
    } else {
      return const
      AssetImage('assets/images/placeholder.png');
    }
  }
}
//   ImageProvider _getImageProvider(String imageUrl) {
//     if (imageUrl.isNotEmpty) {
//       if (Uri
//           .parse(imageUrl)
//           .isAbsolute) {
//         return NetworkImage(imageUrl);
//       } else {
//         return FileImage(File(imageUrl));
//       }
//     } else {
//       return AssetImage('assets/images/placeholder.png');
//     }
//   }
// }


//
//
// import 'package:api/Screens/postdetail.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Controller/post_controller.dart';
// import '../models/post_model.dart';
// import '../widgets/bottombar.dart';
//
// class HomeScreen extends StatelessWidget {
//   final PostController postController = Get.put(PostController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: GetX<PostController>(
//         builder: (controller) {
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//             ),
//             itemCount: controller.posts.length,
//             itemBuilder: (context, index) {
//               final post = controller.posts[index];
//               return _buildPostContainer(context, post);
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavBar(),
//     );
//   }
//
//   Widget _buildPostContainer(BuildContext context, Post post) {
//     return GestureDetector(
//       onTap: () {
//         Get.to(PostDetailScreen(post: post));
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.45, // Set the width of the container
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.grey[200],
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.network(
//                     post.images.isNotEmpty ? post.images[0] : '',
//                     fit: BoxFit.cover,
//                     width: 100,
//                     height: 100,
//                   ),
//                 ),
//                 SizedBox(width: 8.0),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         post.title,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 4.0),
//                       Text(post.location),
//                       SizedBox(height: 4.0),
//                       Row(
//                         children: [
//                           Text('\$${post.price.toString()} /month'),
//                           SizedBox(width: 8.0),
//                           Text('Deposit: 6 months rent'),
//                         ],
//                       ),
//                       SizedBox(height: 4.0),
//                       Row(
//                         children: [
//                           Text('${post.squareFeet} sqft'),
//                           SizedBox(width: 8.0),
//                           Text('Carpet area'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Connect button pressed
//                 // Handle connection logic here
//               },
//               child: Text('Connect'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

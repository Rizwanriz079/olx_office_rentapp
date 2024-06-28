
// search.dart
// import 'package:flutter/material.dart';
//
// class SearchPage extends StatelessWidget {
//   final String searchQuery;
//   final List<dynamic> searchResults;
//   final ValueChanged<String> onSearch;
//
//   SearchPage({required this.searchQuery, required this.searchResults, required this.onSearch});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Results for: $searchQuery'),
//       ),
//       body: ListView.builder(
//         itemCount: searchResults.length,
//         itemBuilder: (context, index) {
//           // Here you can build your search results UI using searchResults[index]
//           return ListTile(
//             title: Text(searchResults[index]),
//             // Add any other UI components you need
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:api/Screens/postdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/post_model.dart'; // Import your post model
import '../Controller/post_controller.dart'; // Import your post controller

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final PostController _postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
              ),
              onChanged: (query) {
                _postController.filterPostsByQuery(query);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _postController.filteredPosts.length,
                itemBuilder: (context, index) {
                  Post post = _postController.filteredPosts[index];
                  return ListTile(
                    title: Text(post.buildingName),
                    subtitle: Text(post.location),
                    onTap: () {
                     Get.to(PostDetailScreen(post: post));
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

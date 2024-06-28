import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/post_model.dart';


class PostController extends GetxController {
  var posts = <Post>[].obs;
  final storage = GetStorage();
  var filteredPosts = <Post>[].obs; // Define filteredPosts

  @override
  void onInit() {
    super.onInit();
    List<dynamic> storedPosts = storage.read('posts') ?? [];
    posts.value = storedPosts.map((e) => Post.fromJson(e)).toList();
    filteredPosts.value = posts; // Initialize filteredPosts with all posts
  }

  void addPost(Post post) {
    posts.add(post);
    storage.write('posts', posts.map((e) => e.toJson()).toList());
    filterPostsByQuery(''); // After adding a post, filter again
  }

  void deletePost(Post post) {
    posts.remove(post);
  }


  void updatePost(Post updatedPost) {
    int index = posts.indexWhere((post) => post.id == updatedPost.id);
    if (index != -1) {
      posts[index] = updatedPost;
    }
  }

  void filterPostsByQuery(String query) {
    if (query.isEmpty) {
      filteredPosts.value = posts;
    } else {
      filteredPosts.value = posts.where((post) {
        return post.buildingName.toLowerCase().contains(query.toLowerCase()) ||
            post.details.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  List<Post> getFilteredPosts() {
    return filteredPosts; // Return the filteredPosts
  }
}

// void updatePost(Post updatedPost) {
//   int index = posts.indexWhere((post) => post.id == updatedPost.id);
//   if (index != -1) {
//     posts[index] = updatedPost;
//     storage.write('posts', posts.map((e) => e.toJson()).toList());
//     filterPostsByQuery(''); // After updating a post, filter again
//   }
// }

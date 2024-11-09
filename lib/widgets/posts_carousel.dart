import 'package:flutter/material.dart';
import 'package:social_media_app/models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarousel({
    required this.pageController,
    required this.title,
    required this.posts,
  });

  Widget _buildPosts(BuildContext context, int index) {
    Post post = posts[index];
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 310,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image:
                  AssetImage(post.imageUrl ?? 'assets/images/placeholder.png'),
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.title ?? 'Untitled',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  post.location ?? 'Unknown Location',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 24,
                          color: Colors.red,
                        ),
                        Text(
                          post.likes != null
                              ? post.likes.toString()
                              : '0', // Show 0 if likes are null
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.comment,
                          color: Colors.blue,
                          size: 24,
                        ),
                        SizedBox(width: 4),
                        Text(
                          post.comments != null
                              ? post.comments.toString()
                              : '0', // Show 0 if comments are null
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          Container(
            height: 400, // Adjust height as needed
            child: PageView.builder(
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPosts(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

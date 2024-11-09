import 'package:flutter/material.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/drawer.dart';
import 'package:social_media_app/widgets/posts_carousel.dart';
import 'package:social_media_app/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  late PageController _yourPostsController;
  late PageController _favouritesController;

  @override
  void initState() {
    super.initState();
    _yourPostsController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    _favouritesController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _yourPostsController.dispose();
    _favouritesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image.asset(
                    widget.user.backgroundImageUrl.toString(),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldState.currentState?.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.user.profileImageUrl.toString(),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.user.name ?? 'User',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Following',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      "${widget.user.following}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Followers',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      "${widget.user.followers}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            PostsCarousel(
              pageController: _yourPostsController,
              title: "Your Posts",
              posts: widget.user.posts ?? [],
            ),
            const SizedBox(height: 20),
            PostsCarousel(
              pageController: _favouritesController,
              title: "Favourites",
              posts: widget.user.favorites ?? [],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/widgets/drawer.dart';
import 'package:social_media_app/widgets/followings_users.dart';
import 'package:social_media_app/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "FRENZY",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Trending"),
            Tab(text: "Latest"),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingsUsers(),
          PostsCarousel(
            pageController:
                _pageController, // Use the non-nullable _pageController
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Define the number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarBrightness: Brightness.light,
//             statusBarIconBrightness: Brightness.dark,
//           ),
//           iconTheme: IconThemeData(
//             color: Theme.of(context).primaryColor,
//           ),
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "FRENZY",
//             style: TextStyle(
//               color: Theme.of(context).primaryColor,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 10,
//             ),
//           ),
//           bottom: const TabBar(
//             labelColor: Colors.deepPurple,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Colors.deepPurple,
//             tabs: [
//               Tab(
//                 text: 'Trending',
//               ),
//               Tab(
//                 text: 'New',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             Center(
//               child: Text("Trending Content"),
//             ),
//             Center(
//               child: Text("New Content"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

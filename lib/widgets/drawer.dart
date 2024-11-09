import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/screens/home-screen.dart';

import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerItem(Icon icon, String title, VoidCallback onTap) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: onTap,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                currentUser.backgroundImageUrl ??
                    'assets/images/placeholder.png',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          currentUser.profileImageUrl ??
                              'assets/images/profile_placeholder.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      currentUser.name ?? 'User',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerItem(
            const Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          ),
          _buildDrawerItem(
            const Icon(Icons.chat_sharp),
            'Chat',
            () {},
          ),
          _buildDrawerItem(
            const Icon(Icons.location_on_outlined),
            'Map',
            () {},
          ),
          _buildDrawerItem(
            const Icon(Icons.account_circle),
            'Your Profile',
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          user: currentUser,
                        )),
              );
            },
          ),
          _buildDrawerItem(
            const Icon(Icons.settings),
            'Settings',
            () {},
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _buildDrawerItem(
                const Icon(Icons.login),
                'Log Out',
                () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

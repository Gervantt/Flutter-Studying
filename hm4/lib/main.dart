import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool isFollowing = false;
  bool isLiked = false;
  int followers = 1200;
  int likes = 340;

  // Follow / Following
  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
      if (isFollowing) {
        followers = followers + 1;
      } else {
        followers = followers - 1;
      }
    });
  }

  // Like: +1 или -1
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likes = likes + 1;
      } else {
        likes = likes - 1;
      }
    });
  }

  // Reset
  void reset() {
    setState(() {
      isFollowing = false;
      isLiked = false;
      followers = 1200;
      likes = 340;
    });
  }

  // Menu button
  Widget menuButton(String text, VoidCallback onPressed, {bool active = false}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        active ? '«  $text  »' : text,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 20,
          letterSpacing: 2,
          color: active ? Colors.white : Colors.white60,
        ),
      ),
    );
  }

  // Statistics
  Widget stat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 13,
            letterSpacing: 3,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1D22),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Аватар
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Имя и профессия
            const Text(
              'DAULET OZHANOV',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 28,
                letterSpacing: 4,
                color: Colors.white,
              ),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 30),

            // Счётчики
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                stat('$followers', 'FOLLOWERS'),
                const SizedBox(width: 50),
                stat('$likes', 'LIKES'),
              ],
            ),
            const SizedBox(height: 30),

            // Кнопки
            menuButton(
              isFollowing ? 'FOLLOWING' : 'FOLLOW',
              toggleFollow,
              active: isFollowing,
            ),
            menuButton(
              isLiked ? 'LIKED' : 'LIKE',
              toggleLike,
              active: isLiked,
            ),
            menuButton('RESET', reset),
          ],
        ),
      ),
    );
  }
}

import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/features/dashboard/post_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, String>> posts = [
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User One',
      'timestamp': '2 hours ago',
      'content': 'This is a sample post content.',
      'postImage': 'assets/images/image.png'
    },
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User Two',
      'timestamp': '3 hours ago',
      'content': 'Another sample post without an image.',
    },

    {
      'profileImage': 'assets/images/image.png',
      'username': 'User Two',
      'timestamp': '3 hours ago',
      'content': 'Another sample post without an image.',
    },
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User Two',
      'timestamp': '3 hours ago',
      'content': 'Another sample post without an image.',
    },
    // Add more posts as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: secondFond,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Post here your avi Stéphan',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10), // Space between input and posts
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostWidget(
                profileImage: post['profileImage']!,
                username: post['username']!,
                timestamp: post['timestamp']!,
                content: post['content']!,
                postImage: post['postImage'],
              );
            },
          ),
        ),
      ],
    );
  }
}

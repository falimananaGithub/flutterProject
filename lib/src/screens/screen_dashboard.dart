import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/features/dashboard/post_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final ScrollController scrollController;
  const DashboardScreen({super.key, required this.scrollController});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> posts = [
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User One',
      'timestamp': '2 hours ago',
      'content': 'This is a sample post content.',
      'postImages': [
        'assets/images/image.png',
        'assets/images/family1.jpeg',
        'assets/images/family2.jpeg'
      ]
    },
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User Two',
      'timestamp': '3 hours ago',
      'content': 'Another sample post without an image.',
      'postImages': [
        'assets/images/image.png',
      ]
    },
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User Two',
      'timestamp': '3 hours ago',
      'content': 'Another sample post without an image.',
      'postImages': [
        'assets/images/image.png',
        'assets/images/image.png',
        'assets/images/image.png'
      ]
    },
    {
      'profileImage': 'assets/images/image.png',
      'username': 'User Two',
      'timestamp': '3 hours ago',
      'content': 'Another sample post without an image.',
      'postImages': [
        'assets/images/image.png',
        'assets/images/image.png',
        'assets/images/image.png'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(10),
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: secondFond,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/family1.jpeg'),
                  )),
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
        // post list view
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostWidget(
              profileImage: post['profileImage']!,
              username: post['username']!,
              timestamp: post['timestamp']!,
              content: post['content']!,
              postImages: post['postImages']!,
            );
          },
        ),
      ],
    );
  }
}

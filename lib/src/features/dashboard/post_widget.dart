import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final String timestamp;
  final String content;
  final String? postImage;

  const PostWidget({
    Key? key,
    required this.profileImage,
    required this.username,
    required this.timestamp,
    required this.content,
    this.postImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with profile image, username, and timestamp
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(profileImage) /*NetworkImage(profileImage)*/,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      timestamp,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Post content
            Text(content),
            const SizedBox(height: 10),
            // Post image (optional)
            if (postImage != null)
              Image.asset(postImage!) /*Image.network(postImage!)*/,
            const SizedBox(height: 10),
            // Like and Comment buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up_alt_outlined),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                  label: const Text('Share'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

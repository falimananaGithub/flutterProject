import 'package:app/src/core/constants/constant.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final String timestamp;
  final String content;
  final List<String> postImages;

  const PostWidget({
    Key? key,
    required this.profileImage,
    required this.username,
    required this.timestamp,
    required this.content,
    required this.postImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: secondFond,
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
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: white),
                    ),
                    Text(
                      timestamp,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: white,
                    ))
              ],
            ),
            const SizedBox(height: 10),
            // Post content
            Text(
              content,
              style: TextStyle(color: white),
            ),
            const SizedBox(height: 10),
            // Post image (optional)

            if (postImages.length == 1) Image.asset(postImages[0]),

            if (postImages.isNotEmpty && postImages.length > 1)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust for the number of images per row
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: postImages.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    postImages[index],
                    fit: BoxFit.cover,
                  );
                },
              ),

            const SizedBox(height: 10),
            // Like and Comment buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up_alt_outlined,
                    color: white,
                  ),
                  label: const Text(
                    '3,6k',
                    style: TextStyle(color: white),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: white,
                  ),
                  label: const Text(
                    '45',
                    style: TextStyle(color: white),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    color: white,
                  ),
                  label: const Text(
                    '20',
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

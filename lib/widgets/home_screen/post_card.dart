import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final bool verified;
  final String timeAgo;
  final String? content;
  final String? imageUrl;
  final int likes;
  final int comments;

  const PostCard({
    super.key,
    required this.avatarUrl,
    required this.username,
    required this.verified,
    required this.timeAgo,
    this.content,
    this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Avatar, Username, Verified Icon, and Time
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 20,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (verified)
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: 16,
                            ),
                        ],
                      ),
                      Text(
                        timeAgo,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),

            // Post content (if exists)
            if (content != null)
              Text(
                content!,
                style: const TextStyle(color: Colors.white),
              ),
            if (imageUrl != null) ...[
              const SizedBox(height: 12.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 12.0),

            // Action Icons with counts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
                      onPressed: () {
                        // Handle like action
                      },
                    ),
                    Text(
                      likes.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment_outlined, color: Colors.white),
                      onPressed: () {
                        // Handle comment action
                      },
                    ),
                    Text(
                      comments.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                  onPressed: () {
                    // Handle share action
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

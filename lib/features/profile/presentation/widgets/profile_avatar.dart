import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double size;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    required this.name,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: _buildAvatarContent(),
    );
  }

  Widget _buildAvatarContent() {
    // If there's a valid image URL, display that
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildInitials();
          },
        ),
      );
    }

    // Fall back to initials
    return _buildInitials();
  }

  Widget _buildInitials() {
    final initials = name.isNotEmpty
        ? name.split(' ').map((part) => part.isNotEmpty ? part[0] : '').join('')
        : '?';
    
    return Center(
      child: Text(
        initials.substring(0, initials.length > 2 ? 2 : initials.length).toUpperCase(),
        style: TextStyle(
          fontSize: size * 0.4,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
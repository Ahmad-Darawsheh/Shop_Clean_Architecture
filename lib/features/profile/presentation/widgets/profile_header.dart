import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/controller/bloc/edit_profile_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProfileBloc>();
    return Column(
      children: [
        ProfileAvatar(
          imageUrl: bloc.image,
          name: bloc.name,
          size: 100,
        ),
        const SizedBox(height: 16),
        Text(
          bloc.name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          bloc.email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        if (bloc.phone != null && bloc.phone!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            bloc.phone!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}

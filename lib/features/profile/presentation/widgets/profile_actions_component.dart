import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/controller/bloc/edit_profile_bloc.dart';

import 'package:shop_app_clean/features/profile/presentation/widgets/app_dialog.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            // _buildActionItem(
            //   context: context,
            //   title: 'Delete Account',
            //   icon: Icons.delete_outline,
            //   iconColor: Colors.red,
            //   textColor: Colors.red,
            //   onTap: () => _showDeleteAccountConfirmation(context),
            // ),
            const Divider(),
            _buildActionItem(
              context: context,
              title: 'Logout',
              icon: Icons.logout,
              iconColor: Colors.blue,
              onTap: () => _showLogoutConfirmation(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Colors.grey[700],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: 'Logout',
        content: 'Are you sure you want to logout?',
        positiveButtonText: 'Logout',
        negativeButtonText: 'Cancel',
        onPositivePressed: () {
          Navigator.pop(context);
          context.read<EditProfileBloc>().add(LogoutUserEvent());
        },
      ),
    );
  }

  // void _showDeleteAccountConfirmation(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AppDialog(
  //       title: 'Delete Account',
  //       content: 'Are you sure you want to delete your account? This action cannot be undone.',
  //       positiveButtonText: 'Delete',
  //       negativeButtonText: 'Cancel',
  //       isDestructiveAction: true,
  //       onPositivePressed: () {
  //         Navigator.pop(context);
  //         // Add logic for deleting account
  //         context.read<EditProfileBloc>().add(DeleteAccountEvent());
  //       },
  //     ),
  //   );
  // }
}
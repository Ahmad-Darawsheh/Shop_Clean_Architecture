import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';
import 'package:shop_app_clean/features/home/presentation/widgets/shared_home_widgets/bottom_nav_bar.dart';
import 'package:shop_app_clean/features/profile/presentation/controller/bloc/edit_profile_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/loading_overlay_component.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/profile_actions_component.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/profile_form.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditProfileBloc>().initializeUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarHome(bloc: context.read<HomeBloc>()),
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: const Text('My Profile'),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            // Handle initial loading or error states if needed
            if (state is EditProfileInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            // Main content - always show the profile form since data is in the bloc
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile header with avatar and basic info
                      Column(
                        children: [
                          ProfileAvatar(
                            imageUrl: context.read<EditProfileBloc>().image,
                            name: context.read<EditProfileBloc>().name,
                            size: 100,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            context.read<EditProfileBloc>().name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            context.read<EditProfileBloc>().email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                          if (context
                              .read<EditProfileBloc>()
                              .phone
                              .isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              context.read<EditProfileBloc>().phone,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                          const SizedBox(height: 24),
                          const Divider(),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Profile form
                      const ProfileForm(),

                      const SizedBox(height: 32),

                      // Logout and other actions
                      ProfileActions(),
                    ],
                  ),
                ),

                // Show loading overlay only when editing profile
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  buildWhen: (previous, current) =>
                      current is EditUserProfileLoadingState ||
                      previous is EditUserProfileLoadingState,
                  builder: (context, editState) {
                    return editState is EditUserProfileLoadingState
                        ? const LoadingOverlay()
                        : const SizedBox.shrink();
                  },
                ),

                // Show success/failure messages
                BlocListener<EditProfileBloc, EditProfileState>(
                  listenWhen: (previous, current) =>
                      current is EditUserProfileSuccessState ||
                      current is EditUserProfileFailureState,
                  listener: (context, editState) {
                    if (editState is EditUserProfileSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile updated successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else if (editState is EditUserProfileFailureState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${editState.message}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

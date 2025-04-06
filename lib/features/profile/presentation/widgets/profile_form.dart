import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/controller/bloc/edit_profile_bloc.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/form_field_component.dart';
import 'package:shop_app_clean/features/profile/presentation/widgets/profile_avatar.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    super.key,
  });

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool _isEditing = false;
  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditProfileBloc>();
    return Form(
      key: bloc.formKey,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isEditing ? Icons.cancel : Icons.edit,
                      color: _isEditing
                          ? Colors.red
                          : Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isEditing) {
                          // Cancel editing, reset values
                          bloc.nameController.text = bloc.name;
                          bloc.emailController.text = bloc.email;
                          bloc.phoneController.text = bloc.phone;
                          bloc.passwordController.clear();
                          _selectedImagePath = null;
                        }
                        _isEditing = !_isEditing;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_isEditing) ...[
                Center(
                  child: ProfileAvatar(
                    imageUrl: bloc.image,
                    name: bloc.name,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              FormFieldWithLabel(
                label: 'Name',
                controller: bloc.nameController,
                icon: Icons.person_outline,
                enabled: _isEditing,
                validator: (value) {
                  if (_isEditing && (value == null || value.isEmpty)) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              FormFieldWithLabel(
                label: 'Email',
                controller: bloc.emailController,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                enabled: _isEditing,
                validator: (value) {
                  if (_isEditing && (value == null || value.isEmpty)) {
                    return 'Please enter your email';
                  } else if (_isEditing &&
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value!)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              FormFieldWithLabel(
                label: 'Phone',
                controller: bloc.phoneController,
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                enabled: _isEditing,
              ),
              if (_isEditing) ...[
                const SizedBox(height: 16),
                FormFieldWithLabel(
                  label: 'Password (leave blank to keep current)',
                  controller: bloc.passwordController,
                  icon: Icons.lock_outline,
                  obscureText: true,
                  enabled: _isEditing,
                ),
              ],
              const SizedBox(height: 24),
              if (_isEditing)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _saveChanges,
                    child: const Text('Save Changes'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    final bloc = context.read<EditProfileBloc>();
    if (bloc.formKey.currentState!.validate()) {
      // Dispatch event to update profile
      bloc.add(
        EditUserProfileEvent(
          name: bloc.nameController.text,
          email: bloc.emailController.text,
          phone: bloc.phoneController.text,
          // Only pass image if it was changed
          image: _selectedImagePath,
          // Only pass password if it's not empty
        ),
      );

      // Exit edit mode
      setState(() {
        _isEditing = false;
      });
    }
  }
}

// Listen for image changes from ProfileAvatar

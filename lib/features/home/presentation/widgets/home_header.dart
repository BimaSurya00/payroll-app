import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    super.initState();
    // Fetch profile when widget is initialized
    Future.delayed(Duration.zero, () {
      context.read<ProfileBloc>().add(OnGetProfile());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220, // Adjust height as needed
      decoration: const BoxDecoration(
        color: AppPallete.primaryBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          // Default values
          String name = 'Guest';
          String position = 'User';
          String department = 'Information Technology';
          String profileImage = 'images/home.jpg';

          // Update values if profile loaded successfully
          if (state is GetProfileSuccess) {
            final profile = state.response.data;
            name = profile?.name ?? 'Guest';
            position = profile?.role ?? 'User';
            profileImage = profile?.profileImage ?? 'images/home.jpg';
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          department,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        position,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  _buildProfileImage(profileImage, state),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileImage(String imageUrl, ProfileState state) {
    // If loading, show shimmer or placeholder
    if (state is GetProfileLoading) {
      return const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white24,
        child: SizedBox.shrink(),
      );
    }

    // If error, show placeholder
    if (state is GetProfileFailure) {
      return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white24,
        child: Icon(Icons.person, color: Colors.white, size: 30),
      );
    }

    // Try to load network image if URL provided, otherwise use asset
    if (imageUrl.startsWith('http')) {
      return CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imageUrl),
        onBackgroundImageError: (exception, stackTrace) {
          debugPrint('Error loading profile image: $exception');
        },
      );
    }

    // Default: asset image
    return CircleAvatar(radius: 30, backgroundImage: AssetImage(imageUrl));
  }
}

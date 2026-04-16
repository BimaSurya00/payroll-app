import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/employment_info_card.dart';
import '../widgets/settings_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0; // 0: Pribadi, 1: Pekerjaan, 2: Pengaturan

  // Profile data variables
  String? _name;
  String? _role;
  String? _profileImage;
  String? _id;
  String? _email;
  String? _phone;
  String? _address;
  String? _position;
  String? _division;
  String? _joiningDate;
  String? _employmentStatus;
  String? _supervisor;

  @override
  void initState() {
    super.initState();
    // Fetch profile when page is initialized
    Future.delayed(Duration.zero, () {
      context.read<ProfileBloc>().add(OnGetProfile());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccess) {
          // Navigate to login page and remove all previous routes
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged out successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AuthLogoutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout failed: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppPallete.backgroundGrey,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            // Handle loading state
            if (state is GetProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Handle error state
            if (state is GetProfileFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gagal memuat profil: ${state.message}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(OnGetProfile());
                      },
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              );
            }

            // Extract profile data if success
            if (state is GetProfileSuccess) {
              final profile = state.response.data;
              _name = profile?.name;
              _role = profile?.role;
              _profileImage = profile?.profileImage;
              _id = profile?.id;
              _email = profile?.email;
              // Phone and address can be fetched from additional API or empty for now
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(
                    name: _name,
                    role: _role,
                    profileImage: _profileImage,
                  ),
                  const SizedBox(height: 20),
                  // Custom Tab Bar Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTabItem('Pribadi', 0),
                        _buildTabItem('Pekerjaan', 1),
                        _buildTabItem('Pengaturan', 2),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5, height: 1),

                  // Content Switching
                  _buildContent(),

                  const SizedBox(height: 80),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return ProfileInfoCard(
          id: _id,
          email: _email,
          phone: _phone,
          address: _address,
        );
      case 1:
        return EmploymentInfoCard(
          position: _position,
          division: _division,
          joiningDate: _joiningDate,
          employmentStatus: _employmentStatus,
          supervisor: _supervisor,
        );
      case 2:
        return const SettingsWidget();
      default:
        return ProfileInfoCard(
          id: _id,
          email: _email,
          phone: _phone,
          address: _address,
        );
    }
  }

  Widget _buildTabItem(String label, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppPallete.primaryBlue : AppPallete.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 60,
            color: isActive ? AppPallete.primaryBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

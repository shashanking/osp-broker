import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:osp_broker/core/infrastructure/providers.dart';
import 'package:osp_broker/features/profile/application/profile_notifier.dart';
import 'package:osp_broker/features/profile/application/profile_model.dart';
import 'package:osp_broker/features/profile/presentation/user_profile_mid_section.dart';
import 'package:osp_broker/features/profile/presentation/user_profile_end_section.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _scheduleProfileInit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _scheduleProfileInit();
    }
  }

  void _scheduleProfileInit() {
    if (_isInitialized) return;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _initProfile();
        _isInitialized = true;
      }
    });
  }

  void _initProfile() {
    print('[ProfilePage] _initProfile called');
    
    // Ensure we're mounted before proceeding
    if (!mounted) return;
    
    // Use a microtask to ensure we're not in the build phase
    Future.microtask(() {
      if (!mounted) return;
      
      final notifier = ref.read(profileNotifierProvider.notifier);
      final authBox = ref.read(authBoxProvider);

      // Always use the current user's ID from auth state
      final userId = authBox.get('userId');
      print('[ProfilePage] User ID from auth box: $userId');
      
      if (userId != null) {
        print('[ProfilePage] Setting profile ID and fetching profile...');
        notifier.setCurrentProfileId(userId);
      } else {
        print('[ProfilePage] No user ID found in auth box');
      }
    });
  }

  void _refreshProfile() {
    final notifier = ref.read(profileNotifierProvider.notifier);
    notifier.fetchCurrentProfile();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileNotifierProvider);
    final userProfile = profileState.userProfile;

    // Show loading indicator while fetching profile
    if (profileState.isLoading && userProfile == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Show error message if there was an error
    if (profileState.errorMessage != null && userProfile == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${profileState.errorMessage}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _refreshProfile,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    // Show empty state if no profile is available
    if (userProfile == null) {
      return const Scaffold(
        body: Center(
          child: Text('No profile data available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cover Image and Profile Picture
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Cover Image
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: userProfile!.profileImageUrl.isNotEmpty
                          ? NetworkImage(userProfile.profileImageUrl)
                          : const AssetImage('assets/images/cover_img.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Picture
                Positioned(
                  left: 20,
                  bottom: -50,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: userProfile.profileImageUrl.isNotEmpty
                          ? Image.network(
                              userProfile.profileImageUrl,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.person, size: 50),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),

            UserProfileDetails(user: userProfile),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  _FollowButton(),
                  const SizedBox(width: 16),
                  _MessageButton(),
                ],
              ),
            ),

            // Stats
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatColumn('Posts', '42'),
                  _buildStatColumn('Following', '1.2K'),
                  _buildStatColumn('Followers', '8.5K'),
                ],
              ),
            ),
            const Divider(),

            // User Stats and About Section
            UserProfileMidSection(userProfile: userProfile),

            // User Posts/Content Section
            const UserProfileEndSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// --- DETAILS WIDGET ---
class UserProfileDetails extends StatelessWidget {
  final UserProfile user;

  const UserProfileDetails({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and verification badge
          Row(
            children: [
              Text(
                user.headLine,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (user.isVerified) ...[
                const SizedBox(width: 8),
                const Icon(Icons.verified, color: Colors.blue, size: 20),
              ],
            ],
          ),

          // Location
          if (user.location.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  user.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],

          // About
          if (user.about.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],

          // Skills
          if (user.skills.isNotEmpty) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: user.skills
                  .map((skill) => Chip(
                        label: Text(skill),
                        backgroundColor: Colors.grey[200],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        labelStyle: const TextStyle(fontSize: 14),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}

// --- REWARD CARD ---
class RewardCard extends StatelessWidget {
  final String iconPath;
  final String value;
  final String label;
  final Gradient gradient;
  const RewardCard({
    super.key,
    required this.iconPath,
    required this.value,
    required this.label,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.4,
      height: 135,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(97),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Image.asset(
              iconPath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: 38,
                  color: Color(0xFF121212),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Color(0xFF232323),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- BUTTONS ---
class _FollowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF24439B), Color(0xFF15A5CD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          '+Follow',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}

class _MessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF24439B), width: 2),
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message, color: const Color(0xFF24439B)),
          const SizedBox(width: 10),
          Text(
            'Message',
            style: const TextStyle(
              color: Color(0xFF24439B),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:osp_broker/core/widgets/navbar.dart';
import 'user_profile_mid_section.dart';

class UserProfileHero extends StatelessWidget {
  const UserProfileHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppNavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Cover Image
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/cover_img.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Picture (overlapping)
                Positioned(
                  left: 16,
                  bottom: -88,
                  child: Container(
                    width: 146,
                    height: 146,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/images/profile_pic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50), // Space for profile image overlap

          // User profile details section
          Transform.translate(
            offset: const Offset(0, -50),
            child: UserProfileDetails(user: demoUserProfile),
          ),

          // Reward cards section
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RewardCard(
                iconPath: 'assets/icons/KudoCoins.png',
                value: '540',
                label: 'Kudo Coins',
                gradient: LinearGradient(
                  begin: Alignment(-1, 0),
                  end: Alignment(1, 0),
                  colors: [
                    Color(0xFFD89B2B),
                    Color(0xFFF7CB80),
                    Color(0xFFE8D5B6),
                  ],
                  stops: [0.03, 0.48, 1.0],
                  transform: GradientRotation(4.535), // ~260deg
                ),
              ),
              SizedBox(width: 40),
              RewardCard(
                iconPath: 'assets/icons/Gems.png',
                value: '2,400',
                label: 'Gem Stones',
                gradient: LinearGradient(
                  begin: Alignment(-1, 0),
                  end: Alignment(1, 0),
                  colors: [
                    Color(0xFFC97FD3),
                    Color(0xFFF3DAE8),
                    Color(0xFFD5ABEC),
                  ],
                  stops: [0.03, 0.54, 1.0],
                  transform: GradientRotation(4.535), // ~260deg
                ),
              ),
            ],
          ),

          // Mid section (Info, Inventory, About, Stats)
          const SizedBox(height: 32),
          const UserProfileMidSection(),
        ],
      ),
      )  );
  }
}

// --- DATA MODEL ---
class UserProfile {
  final String name;
  final String bio;
  final bool isOnline;
  final int followingCount;
  final List<String> followingAvatars;
  
  UserProfile({
    required this.name,
    required this.bio,
    required this.isOnline,
    required this.followingCount,
    required this.followingAvatars,
    
  });
}

final demoUserProfile = UserProfile(
  name: 'Sarah Davis',
  bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  isOnline: true,
  followingCount: 54596,
  followingAvatars: [
    'assets/images/follow1.png',
    'assets/images/follow2.png',
    'assets/images/follow3.png',
  ],
);

// --- DETAILS WIDGET ---
class UserProfileDetails extends StatelessWidget {
  final UserProfile user;
  const UserProfileDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 160), // Space for overlapped profile image
          // Info and actions
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name & bio
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Montserrat',
                              color: Color(0xFF121212),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user.bio,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF656565),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF232323),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF37D159),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    const Text(
                                      'Online',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                             
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Action buttons
                    Row(
                      children: [
                        _FollowButton(),
                        const SizedBox(width: 16),
                        _MessageButton(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Following avatars & count
                Row(
                  children: [
                    ...user.followingAvatars.map((avatar) => Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(avatar),
                          ),
                        )),
                    const SizedBox(width: 10),
                    Text(
                      '${user.followingCount.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (Match m) => "${m[1]},")} Following',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF656565),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
    return Container(
      width: 700,
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

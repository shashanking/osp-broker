import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String headLine,
    required String location,
    required String isVerified,
    required String isProfileComplete,
    required String about,
    required String profileImageUrl,
    required List<String> skills,
    required SocialLinks socialLinks,
    required String userId,
    required String createdAt,
    required String updatedAt,
    required List<dynamic> education,
    required List<dynamic> experience,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // Handle the nested userProfile object if it exists
    final userProfileData = json['userProfile'] as Map<String, dynamic>? ?? {};
    
    return UserProfile(
      id: userProfileData['id'] as String? ?? '',
      headLine: userProfileData['headLine'] as String? ?? '',
      location: userProfileData['location'] as String? ?? '',
      isVerified: userProfileData['isVerified'] as String? ?? 'false',
      isProfileComplete: userProfileData['isProfileComplete'] as String? ?? 'false',
      about: userProfileData['about'] as String? ?? '',
      profileImageUrl: userProfileData['profileImageUrl'] as String? ?? '',
      skills: List<String>.from(userProfileData['skills'] as List<dynamic>? ?? []),
      socialLinks: SocialLinks.fromJson(userProfileData['socialLinks'] as Map<String, dynamic>? ?? {}),
      userId: userProfileData['userId'] as String? ?? '',
      createdAt: userProfileData['createdAt'] as String? ?? '',
      updatedAt: userProfileData['updatedAt'] as String? ?? '',
      education: userProfileData['education'] as List<dynamic>? ?? [],
      experience: userProfileData['experience'] as List<dynamic>? ?? [],
    );
  }
}

@freezed
class SocialLinks with _$SocialLinks {
  const factory SocialLinks({
    String? linkedin,
    String? github,
    String? twitter,
  }) = _SocialLinks;

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
      linkedin: json['linkedin'] as String?,
      github: json['github'] as String?,
      twitter: json['twitter'] as String?,
    );
  }
}

// Simple model for education and experience since they're empty in the response
@freezed
class Education with _$Education {
  const factory Education({
    String? id,
    String? userProfileId,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json['id'] as String?,
        userProfileId: json['userProfileId'] as String?,
      );
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    String? id,
    String? userProfileId,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'] as String?,
        userProfileId: json['userProfileId'] as String?,
      );
}

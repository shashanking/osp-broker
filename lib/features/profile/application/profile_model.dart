import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';


@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String headLine,
    required String location,
    required bool isVerified,
    required bool isProfileComplete,
    required String about,
    required String profileImageUrl,
    required List<String> skills,
    required SocialLinks socialLinks,
    required String userId,
    required String createdAt,
    required String updatedAt,
    required List<Education> education,
    required List<Experience> experience,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

@freezed
class SocialLinks with _$SocialLinks {
  const factory SocialLinks({
    String? linkedin,
    String? github,
    String? twitter,
  }) = _SocialLinks;
  factory SocialLinks.fromJson(Map<String, dynamic> json) => _$SocialLinksFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    String? userProfileId,
  }) = _Education;
  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    String? userProfileId,
  }) = _Experience;
  factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);
}

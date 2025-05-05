import 'package:deckhub/api/app_of_the_day.dart';
import 'package:flux/flux.dart';

import 'package:flutter/material.dart';

import 'appstream.dart';
import 'pagination.dart';

extension FlathubAppstreamMetadataExt on FlathubAppstream {
  String get verificationTagMessage {
    if (metadata?.verificationLoginIsOrganization != null &&
        projectGroup != null) {
      return projectGroup!;
    }

    switch (metadata?.verificationMethod) {
      case 'manual':
        return "Verified";
      case 'website':
        return metadata?.verificationLoginWebsite ?? 'Unknown';
      case 'login_provider':
        return "@${metadata?.verificationLoginName} on $friendlyLoginProviderName";
      default:
        return 'Unknown';
    }
  }

  String get friendlyLoginProviderName {
    switch (metadata?.verificationLoginProvider) {
      case 'github':
        return 'GitHub';
      case 'gitlab':
        return 'GitLab';
      case 'kde':
        return 'KDE GitLab';
      case 'gnome':
        return 'GNOME GitLab';
      default:
        return 'Unknown';
    }
  }
}

extension FlathubAppstreamScreenShotExt on FlathubAppstreamScreenShot {
  FlathubAppstreamScreenShotSize? pickSize([int? maxHeight]) {
    final orderedByResolution = sizes.toList()
      ..sort((a, b) {
        if (a.width > b.width) {
          return -1;
        } else if (a.width < b.width) {
          return 1;
        } else {
          if (a.height > b.height) {
            return -1;
          } else if (a.height < b.height) {
            return 1;
          } else {
            return 0;
          }
        }
      });

    final highestResolution = orderedByResolution.firstWhere(
      (element) => maxHeight == null || element.height <= maxHeight,
      orElse: () => orderedByResolution.first,
    );

    return highestResolution.copyWith(
      caption: caption,
    );
  }
}

extension FlathubAppHitExt on FlathubAppHit {
  String get verificationMessage {
    switch (verificationMethod) {
      case 'manual':
        return "The ownership of this app has been manually verified by the Flathub team";
      case 'website':
        return "The ownership of this app has been verified using $verificationWebsite";
      case 'login_provider':
        return "The ownership of this app has been verified by $verificationLoginName on $friendlyLoginProviderName";
      default:
        return 'Unknown';
    }
  }

  String get friendlyLoginProviderName {
    switch (verificationLoginProvider) {
      case 'github':
        return 'GitHub';
      case 'gitlab':
        return 'GitLab';
      case 'kde':
        return 'KDE GitLab';
      case 'gnome':
        return 'GNOME GitLab';
      default:
        return 'Unknown';
    }
  }
}

extension FlathubAppstreamDesktopExtension on FlathubAppstreamDesktop {
  Color getBrandColor(BuildContext context) {
    if (branding.isEmpty) {
      return context.colorScheme.surfaceContainer;
    }

    for (final branding in branding) {
      switch ((branding.schemePreference, context.brightness)) {
        case (FlathubAppstreamBrandingSchema.light, Brightness.light):
          return Color(int.parse(branding.value.substring(1), radix: 16))
              .withOpacity(1.0);
        case (FlathubAppstreamBrandingSchema.dark, Brightness.dark):
          return Color(int.parse(branding.value.substring(1), radix: 16))
              .withOpacity(1.0);
        default:
      }
    }

    return Color(int.parse(branding.first.value.substring(1), radix: 16));
  }
}


extension RecommendedExtension on RecommendedApp {
  Color getBrandColor(BuildContext context) {
    if (branding.isEmpty) {
      return context.colorScheme.surfaceContainer;
    }

    for (final branding in branding) {
      switch ((branding.schemePreference, context.brightness)) {
        case (FlathubAppstreamBrandingSchema.light, Brightness.light):
          return Color(int.parse(branding.value.substring(1), radix: 16))
              .withOpacity(1.0);
        case (FlathubAppstreamBrandingSchema.dark, Brightness.dark):
          return Color(int.parse(branding.value.substring(1), radix: 16))
              .withOpacity(1.0);
        default:
      }
    }

    return Color(int.parse(branding.first.value.substring(1), radix: 16));
  }
}

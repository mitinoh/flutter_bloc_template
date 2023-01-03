
enum ReportUserType { SPAM, NUDE, SCAM, HATE, BULLYING, OTHER }

extension ReportUserExtension on ReportUserType {
  String get description {
    switch (this) {
      case ReportUserType.SPAM:
        return "Spam";

      case ReportUserType.NUDE:
        return "Nude or sexual acts";

      case ReportUserType.SCAM:
        return "Scam or fraud";

      case ReportUserType.HATE:
        return "Speeches or symbols that incite hatred";

      case ReportUserType.BULLYING:
        return "Bullying or intimidation";

      case ReportUserType.OTHER:
        return "Other";

      default:
        return "Other";
    }
  }
}

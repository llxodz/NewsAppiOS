// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Breaking News
  internal static let breakingNews = L10n.tr("Localizable", "BreakingNews", fallback: "Breaking News")
  internal enum Detail {
    /// Author
    internal static let author = L10n.tr("Localizable", "Detail.Author", fallback: "Author")
    /// The author is not specified
    internal static let notAuthor = L10n.tr("Localizable", "Detail.NotAuthor", fallback: "The author is not specified")
    /// Share
    internal static let shareButton = L10n.tr("Localizable", "Detail.ShareButton", fallback: "Share")
  }
  internal enum Network {
    /// us
    internal static let country = L10n.tr("Localizable", "Network.Country", fallback: "us")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum JangGaeJaRangAsset {
  public static let accentColor = JangGaeJaRangColors(name: "AccentColor")
  public static let background = JangGaeJaRangColors(name: "background")
  public static let defaultGreen = JangGaeJaRangColors(name: "defaultGreen")
  public static let disabledGreen = JangGaeJaRangColors(name: "disabledGreen")
  public static let gray1 = JangGaeJaRangColors(name: "gray1")
  public static let gray2 = JangGaeJaRangColors(name: "gray2")
  public static let gray3 = JangGaeJaRangColors(name: "gray3")
  public static let gray4 = JangGaeJaRangColors(name: "gray4")
  public static let gray5 = JangGaeJaRangColors(name: "gray5")
  public static let gray6 = JangGaeJaRangColors(name: "gray6")
  public static let gray7 = JangGaeJaRangColors(name: "gray7")
  public static let jangGaeJaRangLogo = JangGaeJaRangImages(name: "JangGaeJaRangLogo")
  public static let phy = JangGaeJaRangImages(name: "Phy")
  public static let pets = JangGaeJaRangImages(name: "pets")
  public static let profileBorder = JangGaeJaRangImages(name: "profileBorder")
  public static let profileImage = JangGaeJaRangImages(name: "profileImage")
  public static let profileSmall = JangGaeJaRangImages(name: "profileSmall")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class JangGaeJaRangColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension JangGaeJaRangColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: JangGaeJaRangColors) {
    let bundle = JangGaeJaRangResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

public struct JangGaeJaRangImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = JangGaeJaRangResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

public extension JangGaeJaRangImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the JangGaeJaRangImages.image property")
  convenience init?(asset: JangGaeJaRangImages) {
    #if os(iOS) || os(tvOS)
    let bundle = JangGaeJaRangResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all

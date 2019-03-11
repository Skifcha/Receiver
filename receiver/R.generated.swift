//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.image` struct is generated, and contains static references to 7 images.
  struct image {
    /// Image `appstore-icon`.
    static let appstoreIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "appstore-icon")
    /// Image `chevron-icon`.
    static let chevronIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "chevron-icon")
    /// Image `family-sharing-icon`.
    static let familySharingIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "family-sharing-icon")
    /// Image `icoud-icon`.
    static let icoudIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "icoud-icon")
    /// Image `kisi-logo`.
    static let kisiLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "kisi-logo")
    /// Image `lock-tabbar-icon`.
    static let lockTabbarIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "lock-tabbar-icon")
    /// Image `profile-tabbar-icon`.
    static let profileTabbarIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "profile-tabbar-icon")
    
    /// `UIImage(named: "appstore-icon", bundle: ..., traitCollection: ...)`
    static func appstoreIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.appstoreIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "chevron-icon", bundle: ..., traitCollection: ...)`
    static func chevronIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.chevronIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "family-sharing-icon", bundle: ..., traitCollection: ...)`
    static func familySharingIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.familySharingIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icoud-icon", bundle: ..., traitCollection: ...)`
    static func icoudIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icoudIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "kisi-logo", bundle: ..., traitCollection: ...)`
    static func kisiLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.kisiLogo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "lock-tabbar-icon", bundle: ..., traitCollection: ...)`
    static func lockTabbarIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.lockTabbarIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "profile-tabbar-icon", bundle: ..., traitCollection: ...)`
    static func profileTabbarIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.profileTabbarIcon, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `AnimatedUnlockView`.
    static let animatedUnlockView = _R.nib._AnimatedUnlockView()
    /// Nib `ProfileHeaderView`.
    static let profileHeaderView = _R.nib._ProfileHeaderView()
    
    /// `UINib(name: "AnimatedUnlockView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.animatedUnlockView) instead")
    static func animatedUnlockView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.animatedUnlockView)
    }
    
    /// `UINib(name: "ProfileHeaderView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.profileHeaderView) instead")
    static func profileHeaderView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.profileHeaderView)
    }
    
    static func animatedUnlockView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> AnimatedUnlockView? {
      return R.nib.animatedUnlockView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? AnimatedUnlockView
    }
    
    static func profileHeaderView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProfileHeaderView? {
      return R.nib.profileHeaderView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProfileHeaderView
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ProfileTableViewCell`.
    static let profileTableViewCell: Rswift.ReuseIdentifier<ProfileTableViewCell> = Rswift.ReuseIdentifier(identifier: "ProfileTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _ProfileHeaderView.validate()
    }
    
    struct _AnimatedUnlockView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "AnimatedUnlockView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> AnimatedUnlockView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? AnimatedUnlockView
      }
      
      fileprivate init() {}
    }
    
    struct _ProfileHeaderView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "ProfileHeaderView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProfileHeaderView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProfileHeaderView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "kisi-logo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'kisi-logo' is used in nib 'ProfileHeaderView', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController
      
      let bundle = R.hostingBundle
      let lockStatusViewController = StoryboardViewControllerResource<LockStatusViewController>(identifier: "LockStatusViewController")
      let name = "Main"
      let profileViewController = StoryboardViewControllerResource<ProfileViewController>(identifier: "ProfileViewController")
      
      func lockStatusViewController(_: Void = ()) -> LockStatusViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: lockStatusViewController)
      }
      
      func profileViewController(_: Void = ()) -> ProfileViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: profileViewController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "chevron-icon", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'chevron-icon' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "lock-tabbar-icon", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'lock-tabbar-icon' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "profile-tabbar-icon", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'profile-tabbar-icon' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.main().lockStatusViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'lockStatusViewController' could not be loaded from storyboard 'Main' as 'LockStatusViewController'.") }
        if _R.storyboard.main().profileViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'profileViewController' could not be loaded from storyboard 'Main' as 'ProfileViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}

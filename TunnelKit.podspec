Pod::Spec.new do |s|
    s.name             = "TunnelKit"
    s.version          = "6.3.3"
    s.summary          = "TunnelKit - Unified framework for OpenVPN/WireGuard"
    s.description      = <<-DESC
      This is a CocoaPods podspec for TunnelKit, originally built with SwiftPM in mind. 
      It provides subspecs for OpenVPN, WireGuard, LZO, etc.
    DESC
    s.homepage         = "https://github.com/Mithat3313/tunnelkit"
    s.license          = { :type => "MIT" }
    s.author           = { "Mithat3313" => "mithatcolakel@gmail.com" }
  
    # CocoaPods’a kaynağın nerede olduğunu söyleyin
    # (Lokal path: '.' => Bu .podspec dosyasının bulunduğu klasör)
    s.source           = { :path => "." }
  
    # Swift 5.9, iOS 15
    s.swift_version    = "5.9"
    s.platform         = :ios, "15.0"

    # --- SUBSPECS ---
  
    # 1) Core (TunnelKit, TunnelKitCore, Manager, AppExtension...) 
    s.subspec "Core" do |core|
      core.source_files = [
        "Sources/TunnelKit**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitCore**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitOpenVPN**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitWireGuard**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitManager/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitAppExtension/**/*.{swift,h,m,c,cpp}"
      ]
      core.dependency 'SwiftyBeaver', '~> 1.9.0'
    end
  
    # 2) OpenVPN 
    s.subspec "OpenVPN" do |openvpn|
      openvpn.source_files = [
        "Sources/TunnelKitOpenVPN/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitOpenVPNCore/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitOpenVPNManager/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitOpenVPNProtocol/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitOpenVPNAppExtension/**/*.{swift,h,m,c,cpp}"
      ]
      # Bu alt modül, "Core" modülüne bağımlıysa:
      openvpn.dependency "TunnelKit/Core"
      openvpn.dependency 'SwiftyBeaver'
    end
  
    # 3) WireGuard
    s.subspec "WireGuard" do |wg|
      wg.source_files = [
        "Sources/TunnelKitWireGuard/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitWireGuardCore/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitWireGuardManager/**/*.{swift,h,m,c,cpp}",
        "Sources/TunnelKitWireGuardAppExtension/**/*.{swift,h,m,c,cpp}"
      ]
      wg.dependency "TunnelKit/Core"
      # wg.ios.frameworks = ['NetworkExtension']
    end
  end
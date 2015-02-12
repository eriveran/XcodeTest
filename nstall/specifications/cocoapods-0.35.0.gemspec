# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cocoapods"
  s.version = "0.35.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eloy Duran", "Fabio Pelosin"]
  s.date = "2014-11-19"
  s.description = "CocoaPods manages library dependencies for your Xcode project.\n\nYou specify the dependencies for your project in one easy text file. CocoaPods resolves dependencies between libraries, fetches source code for the dependencies, and creates and maintains an Xcode workspace to build your project.\n\nUltimately, the goal is to improve discoverability of, and engagement in, third party open-source libraries, by creating a more centralized ecosystem."
  s.email = ["eloy.de.enige@gmail.com", "fabiopelosin@gmail.com"]
  s.executables = ["pod", "sandbox-pod"]
  s.files = ["bin/pod", "bin/sandbox-pod"]
  s.homepage = "https://github.com/CocoaPods/CocoaPods"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.0.14"
  s.summary = "An Objective-C library package manager."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cocoapods-core>, ["= 0.35.0"])
      s.add_runtime_dependency(%q<claide>, ["~> 0.7.0"])
      s.add_runtime_dependency(%q<xcodeproj>, ["~> 0.20.2"])
      s.add_runtime_dependency(%q<cocoapods-downloader>, ["~> 0.8.0"])
      s.add_runtime_dependency(%q<cocoapods-plugins>, ["~> 0.3.1"])
      s.add_runtime_dependency(%q<cocoapods-try>, ["~> 0.4.2"])
      s.add_runtime_dependency(%q<cocoapods-trunk>, ["~> 0.4.1"])
      s.add_runtime_dependency(%q<molinillo>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<colored>, ["~> 1.2"])
      s.add_runtime_dependency(%q<escape>, ["~> 0.0.4"])
      s.add_runtime_dependency(%q<open4>, ["~> 1.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.2.15"])
      s.add_runtime_dependency(%q<nap>, ["~> 0.8"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<bacon>, ["~> 1.1"])
    else
      s.add_dependency(%q<cocoapods-core>, ["= 0.35.0"])
      s.add_dependency(%q<claide>, ["~> 0.7.0"])
      s.add_dependency(%q<xcodeproj>, ["~> 0.20.2"])
      s.add_dependency(%q<cocoapods-downloader>, ["~> 0.8.0"])
      s.add_dependency(%q<cocoapods-plugins>, ["~> 0.3.1"])
      s.add_dependency(%q<cocoapods-try>, ["~> 0.4.2"])
      s.add_dependency(%q<cocoapods-trunk>, ["~> 0.4.1"])
      s.add_dependency(%q<molinillo>, ["~> 0.1.2"])
      s.add_dependency(%q<colored>, ["~> 1.2"])
      s.add_dependency(%q<escape>, ["~> 0.0.4"])
      s.add_dependency(%q<open4>, ["~> 1.3"])
      s.add_dependency(%q<activesupport>, [">= 3.2.15"])
      s.add_dependency(%q<nap>, ["~> 0.8"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bacon>, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<cocoapods-core>, ["= 0.35.0"])
    s.add_dependency(%q<claide>, ["~> 0.7.0"])
    s.add_dependency(%q<xcodeproj>, ["~> 0.20.2"])
    s.add_dependency(%q<cocoapods-downloader>, ["~> 0.8.0"])
    s.add_dependency(%q<cocoapods-plugins>, ["~> 0.3.1"])
    s.add_dependency(%q<cocoapods-try>, ["~> 0.4.2"])
    s.add_dependency(%q<cocoapods-trunk>, ["~> 0.4.1"])
    s.add_dependency(%q<molinillo>, ["~> 0.1.2"])
    s.add_dependency(%q<colored>, ["~> 1.2"])
    s.add_dependency(%q<escape>, ["~> 0.0.4"])
    s.add_dependency(%q<open4>, ["~> 1.3"])
    s.add_dependency(%q<activesupport>, [">= 3.2.15"])
    s.add_dependency(%q<nap>, ["~> 0.8"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bacon>, ["~> 1.1"])
  end
end

# -*- encoding: utf-8 -*-
# stub: jekyll-org 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-org".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["eggcaker".freeze]
  s.date = "2018-01-12"
  s.description = "So you want org-mode support for Jekyll. Write your _posts in org-mode, then add 'gems: [jekyll-org]' to your _config.yml. Thats it!".freeze
  s.email = "eggcaker@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.org".freeze]
  s.files = ["LICENSE".freeze, "README.org".freeze]
  s.homepage = "http://eggcaker.github.io/jekyll-org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.3".freeze
  s.summary = "Jekyll converter for org-mode files".freeze

  s.installed_by_version = "2.5.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<org-ruby>.freeze, [">= 0.9.12"])
      s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.5.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 3.5.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.5.0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 3.12"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.0"])
      s.add_development_dependency(%q<jeweler>.freeze, [">= 2.1.1"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0.12.0"])
    else
      s.add_dependency(%q<org-ruby>.freeze, [">= 0.9.12"])
      s.add_dependency(%q<jekyll>.freeze, [">= 3.5.0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 3.5.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.5.0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 3.12"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.0"])
      s.add_dependency(%q<jeweler>.freeze, [">= 2.1.1"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0.12.0"])
    end
  else
    s.add_dependency(%q<org-ruby>.freeze, [">= 0.9.12"])
    s.add_dependency(%q<jekyll>.freeze, [">= 3.5.0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 3.5.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.5.0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 3.12"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 2.1.1"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.12.0"])
  end
end

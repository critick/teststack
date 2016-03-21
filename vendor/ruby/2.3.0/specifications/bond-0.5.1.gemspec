# -*- encoding: utf-8 -*-
# stub: bond 0.5.1 ruby lib
# stub: ext/readline_line_buffer/extconf.rb

Gem::Specification.new do |s|
  s.name = "bond".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gabriel Horner".freeze]
  s.date = "2014-02-08"
  s.description = "Bond is on a mission to improve autocompletion in ruby, especially for irb/ripl. Aside from doing everything irb's can do and fixing its quirks, Bond can autocomplete argument(s) to methods, uniquely completing per module, per method and per argument. Bond brings ruby autocompletion closer to bash/zsh as it provides a configuration system and a DSL for creating custom completions and completion rules. With this configuration system, users can customize their autocompletions and share it with others. Bond can also load completions that ship with gems.  Bond is able to offer more than irb's completion since it uses the full line of input when completing as opposed to irb's last-word approach.".freeze
  s.email = "gabriel.horner@gmail.com".freeze
  s.extensions = ["ext/readline_line_buffer/extconf.rb".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze, "LICENSE.txt".freeze]
  s.files = ["LICENSE.txt".freeze, "README.rdoc".freeze, "ext/readline_line_buffer/extconf.rb".freeze]
  s.homepage = "http://tagaholic.me/bond/".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--title".freeze, "Bond 0.5.1 Documentation".freeze]
  s.rubygems_version = "2.6.2".freeze
  s.summary = "Mission: Easy custom autocompletion for arguments, methods and beyond. Accomplished for irb and any other readline-like console environments.".freeze

  s.installed_by_version = "2.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bacon>.freeze, [">= 1.1.0"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.12.1"])
      s.add_development_dependency(%q<mocha-on-bacon>.freeze, ["~> 0.2.1"])
      s.add_development_dependency(%q<bacon-bits>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bacon>.freeze, [">= 1.1.0"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.12.1"])
      s.add_dependency(%q<mocha-on-bacon>.freeze, ["~> 0.2.1"])
      s.add_dependency(%q<bacon-bits>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bacon>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.12.1"])
    s.add_dependency(%q<mocha-on-bacon>.freeze, ["~> 0.2.1"])
    s.add_dependency(%q<bacon-bits>.freeze, [">= 0"])
  end
end

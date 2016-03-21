# -*- encoding: utf-8 -*-
# stub: archive-tar-minitar 0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "archive-tar-minitar".freeze
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Austin Ziegler, Mauricio Ferna'ndez".freeze]
  s.date = "2008-02-26"
  s.description = "Archive::Tar::Minitar is a pure-Ruby library and command-line utility that provides the ability to deal with POSIX tar(1) archive files. The implementation is based heavily on Mauricio Ferna'ndez's implementation in rpa-base, but has been reorganised to promote reuse in other projects.".freeze
  s.email = "minitar@halostatue.ca".freeze
  s.executables = ["minitar".freeze]
  s.extra_rdoc_files = ["README".freeze, "ChangeLog".freeze, "Install".freeze]
  s.files = ["ChangeLog".freeze, "Install".freeze, "README".freeze, "bin/minitar".freeze]
  s.homepage = "http://rubyforge.org/projects/ruwiki/".freeze
  s.rdoc_options = ["--title".freeze, "Archive::Tar::MiniTar -- A POSIX tarchive library".freeze, "--main".freeze, "README".freeze, "--line-numbers".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2".freeze)
  s.rubyforge_project = "ruwiki".freeze
  s.rubygems_version = "2.6.2".freeze
  s.summary = "Provides POSIX tarchive management from Ruby programs.".freeze

  s.installed_by_version = "2.6.2" if s.respond_to? :installed_by_version
end

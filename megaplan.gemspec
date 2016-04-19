# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'megaplan/version'

Gem::Specification.new do |spec|
  spec.name          = "megaplan"
  spec.version       = Megaplan::VERSION
  spec.authors       = ["Viacheslav Gruzdov"]
  spec.email         = ["lucky-@mail.ru"]

  spec.summary       = "Simple Ruby shell for Megaplan.ru API"
  spec.description   = "Megaplan on Rails"
  spec.homepage      = "https://github.com/nononoy/megaplan-rb"
  spec.license       = "MIT"

  spec.files         = [
      "Gemfile",
      "Gemfile.lock",
      "README.md",
      "Rakefile",
      "lib/megaplan.rb",
      "lib/megaplan/api.rb",
      "lib/megaplan/checklist.rb",
      "lib/megaplan/comment.rb",
      "lib/megaplan/contractor.rb",
      "lib/megaplan/deal.rb",
      "lib/megaplan/employee.rb",
      "lib/megaplan/event.rb",
      "lib/megaplan/favorite.rb",
      "lib/megaplan/filter.rb",
      "lib/megaplan/history.rb",
      "lib/megaplan/informer.rb",
      "lib/megaplan/invoice.rb",
      "lib/megaplan/message.rb",
      "lib/megaplan/offer.rb",
      "lib/megaplan/payer.rb",
      "lib/megaplan/project.rb",
      "lib/megaplan/search.rb",
      "lib/megaplan/severity.rb",
      "lib/megaplan/system.rb",
      "lib/megaplan/tag.rb",
      "lib/megaplan/task.rb",
      "lib/megaplan/todo_list.rb",
      "lib/megaplan/topic.rb",
      "lib/megaplan/unit.rb",
      "lib/megaplan/user.rb",
      "lib/megaplan/version.rb",
      "megaplan.gemspec",
      "spec/megaplan_spec.rb",
      "spec/spec_helper.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

require_relative "lib/active_record/connection_adapters/postgresql/oid/time/version"

Gem::Specification.new do |spec|
  spec.name        = "active_record-connection_adapters-postgresql-oid-time"
  spec.version     = ActiveRecord::ConnectionAdapters::Postgresql::Oid::Time::VERSION
  spec.authors     = ["mansakondo"]
  spec.email       = ["mansakondo22@gmail.com"]
  spec.homepage    = "https://github.com/mansakondo/activerecord-connection_adapters-postgresql-oid-time"
  spec.summary     = "ActiveRecord time type for Postgres"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "activerecord", ">= 6.0"
end

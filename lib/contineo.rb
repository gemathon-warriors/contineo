require "contineo/version"
require 'active_record'
require 'rails'

module Contineo
  def self.db(db_env)
    db_env.split('_'+ env(db_env)).first.camelcase
  end

  def self.env(db_env)
    db_env.split('_').last
  end

  def self.other_than_application_db?(db_env)
    db_env.split('_').size > 1
  end

  def self.define_db_connection_class(db_env)
    klass = Object.const_set(db(db_env), Class.new(ActiveRecord::Base) { 
              self.abstract_class = true
              def self.inherited(base)
                contineo
              end
            })
      
    klass.define_singleton_method(:contineo) { establish_connection db_env }
    klass
  end

  def self.configurations
    begin
      YAML.load_file(CONFIG_PATH)
    rescue NameError => e
      YAML.load_file("config/database.yml")  
    end
  end

  def self.create_connections
    configurations.each do |db_env, connection_hash|
      if other_than_application_db?(db_env) && ::Rails.env == env(db_env)
        define_db_connection_class(db_env)
      end
    end
  end

  create_connections
end

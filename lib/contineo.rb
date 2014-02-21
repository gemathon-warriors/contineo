require "contineo/version"
require 'active_record'
require 'rails'

module Contineo
  CONFIG = begin
    YAML.load_file(CONFIG_PATH)
  rescue NameError => e
    YAML.load_file("config/database.yml")  
  end

  CONFIG.each do |db_env, connection_hash|
    env = db_env.split('_').last

    if db_env.split('_').size > 1 && ::Rails.env == env
      db  = db_env.split('_'+env).first
      
      klass = Object.const_set(db.camelcase, Class.new(ActiveRecord::Base) { 
        self.abstract_class = true
        def self.inherited(base)
          contineo
        end
      })
      
      klass.define_singleton_method(:contineo) { establish_connection db_env }
    end
  end

end

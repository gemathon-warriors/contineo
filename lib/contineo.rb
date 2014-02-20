require "contineo/version"
require 'active_record'

module Contineo
  CONFIG = YAML.load_file("config/database.yml")
  CONFIG.each do |db_env, connection_hash|
    env = db_env.split('_').last
    
    if db_env.split('_').size > 1
      db  = db_env.split('_'+env).first
      
      klass = Object.const_set(db.camelcase, Class.new(ActiveRecord::Base) { 
        self.abstract_class = true
      })

      klass.define_singleton_method(:contineo) { establish_connection db_env }
    end
  end
end

require 'merb-cache'

module Merb
  module Cache
    def self.setup(&blk)
      if Merb::BootLoader.finished?(Merb::BootLoader::BeforeAppLoads)
        evil_instance_eval(&blk)
      else
        Merb::BootLoader.before_app_loads do
          evil_instance_eval(&blk)
        end
      end
    end

    def self.evil_instance_eval(&blk)
      hijack_const_missing

      begin
        instance_eval(&blk) unless blk.nil?
      ensure
        release_const_missing
      end
    end

    def self.hijack_const_missing
      Module.class_eval do
        def const_missing_for_merb_cache(sym)
          eval("Merb::Cache::#{sym}") rescue const_missing_for_object(sym)
        end

        alias_method :const_missing_for_object, :const_missing
        alias_method :const_missing, :const_missing_for_merb_cache
      end
    end

    def self.release_const_missing
      Module.class_eval do
        alias_method :const_missing, :const_missing_for_object
        undef const_missing_for_merb_cache
      end
    end
  end
end
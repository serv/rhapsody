require 'yaml'
require_relative '../lib/rhapsody'

module ConfigHelper
  def ConfigHelper.load
    config_path = Dir.pwd.to_s + '/spec/config.yml'

    if File.exist?(config_path)
      YAML.load_file(config_path)
    else
      raise 'spec/config.yml not found.'
    end
  end
end

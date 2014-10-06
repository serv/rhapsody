class Rhapsody::Member
  require 'json'

  attr_accessor :attr_list

  class << self
    # TODO: This needs to be global / base
    def define_attr_accessor(key)
      __send__(:attr_accessor, key)
    end

    def to_camelcase(key)
      key.to_s.underscore
    end
  end

  def initialize(options)
    if options
      self.attr_list = []

      options.each do |key, value|
        key = Rhapsody::Member.to_camelcase(key)

        # Set attr_accessor dynamically
        Rhapsody::Member.define_attr_accessor(key)
        self.attr_list << key

        # Set value for the attribute
        send("#{key}=", value)
      end
    end
  end


end

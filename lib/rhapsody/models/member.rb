class Rhapsody::Member
  require 'json'

  ATTR_LIST_HASH = [
    {attribute: :cobrand, type: 'String'},
    {attribute: :cocat, type: 'String'},
    {attribute: :email, type: 'String'},
    {attribute: :logon, type: 'String'},
    {attribute: :first_name, type: 'String'},
    {attribute: :id, type: 'String'},
    {attribute: :last_name, type: 'String'},
    {attribute: :locale, type: 'String'},
    {attribute: :country, type: 'String'},
    {attribute: :is_public, type: 'Boolean'},
    {attribute: :billing_partner_code, type: 'String'},
    {attribute: :create_date, type: 'Integer'},
    {attribute: :is_suspended, type: 'Boolean'},
    {attribute: :tier_code, type: 'String'},
    {attribute: :tier_name, type: 'String'},
    {attribute: :product_code, type: 'String'},
    {attribute: :product_name, type: 'String'},
    {attribute: :expiration_date, type: 'Integer'},
    {attribute: :trial_length_days, type: 'Integer'},
    {attribute: :is_trial, type: 'Boolean'},
    {attribute: :state, type: 'String'},
    {attribute: :can_stream_on_web, type: 'Boolean'},
    {attribute: :can_stream_on_mobile, type: 'Boolean'},
    {attribute: :can_stream_on_home_device, type: 'Boolean'},
    {attribute: :can_stream_on_pc, type: 'Boolean'},
    {attribute: :can_upgrade_streams, type: 'Boolean'},
    {attribute: :max_stream_count, type: 'Integer'},
    {attribute: :is_play_based_tier, type: 'Boolean'},
    {attribute: :is_monthly_play_based_tier, type: 'Boolean'},
    {attribute: :is_one_time_play_based_tier, type: 'Boolean'},
    {attribute: :total_plays, type: 'Integer'},
    {attribute: :plays_remaining, type: 'Integer'}
  ]

  class << self
    def attr_list_hash_attr
      ATTR_LIST_HASH.map {|hash| hash[:attribute] }
    end

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
      options.each do |key, value|
        key = Rhapsody::Member.to_camelcase(key)

        # Set attr_accessor dynamically
        Rhapsody::Member.define_attr_accessor(key)

        # Set value for the attribute
        send("#{key}=", value)
      end
    end
  end


end

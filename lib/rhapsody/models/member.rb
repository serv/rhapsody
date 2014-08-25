class Rhapsody::Member
  ATTR_LIST = [
    :cobrand,
    :cocat,
    :email,
    :logon,
    :firstName,
    :id,
    :lastName,
    :locale,
    :country,
    :isPublic,
    :billingPartnerCode,
    :catalog,
    :createDate,
    :isSuspended,
    :tierCode,
    :tierName,
    :productCode,
    :productName,
    :expirationDate,
    :trialLengthDays,
    :isTrial,
    :state,
    :canStreamOnWeb,
    :canStreamOnMobile,
    :canStreamOnHomeDevice,
    :canStreamOnPC,
    :canUpgradeStreams,
    :maxStreamCount,
    :isPlayBasedTier,
    :isMonthlyPlayBasedTier,
    :isOneTimePlayBasedTier,
    :totalPlays,
    :playsRemaining
  ]

  attr_accessor *ATTR_LIST

  def initialize(options)
    if options
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end

end

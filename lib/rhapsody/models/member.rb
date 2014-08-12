class Rhapsody::Member
  attr_accessor :cobrand,
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

  def initialize(options)
    if options
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end

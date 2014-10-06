require 'spec_helper'

describe Rhapsody::ClientsController do
  it 'has HOST_URL' do
    host_url = Rhapsody::HOST_URL
    expect(host_url).to eql('https://api.rhapsody.com')
  end

  it 'has attributes' do
    options = AuthenticationHelper.post_hash
    client_controller = Rhapsody::ClientsController.new(options)

    expect(client_controller).to respond_to(:api_key)
    expect(client_controller).to respond_to(:api_secret)
    expect(client_controller).to respond_to(:auth_code)
    expect(client_controller).to respond_to(:redirect_url)
    expect(client_controller).to respond_to(:raw_reponse)
    expect(client_controller).to respond_to(:json_response)
    expect(client_controller).to respond_to(:response_status)
    expect(client_controller).to respond_to(:access_token)
    expect(client_controller).to respond_to(:refresh_token)
    expect(client_controller).to respond_to(:expires_in)
  end

  it '#me_account' do
    options = AuthenticationHelper.post_hash
    client_controller = Rhapsody::ClientsController.new(options)
    client_controller.access_token = AuthenticationHelper.get_access_token

    member = client_controller.me_account

    member_attributes = [
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
    member_attributes.each do |attr|
      expect(member).to respond_to(attr.to_s.underscore)
    end
  end

  it '#renew' do
    client_controller = AuthenticationHelper.get_connected_client
    client_controller.renew

    expect(client_controller.response_status).to eql(200)
  end
end

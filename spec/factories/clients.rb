FactoryGirl.define do
  factory :client do
    api_key
    api_secret
    auth_code
    redirect_url
    raw_reponse
    json_response
    response_status
    access_token
    refresh_token
  end
end

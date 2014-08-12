class Rhapsody::MembersController
  attr_accessor :path,
                :access_token,
                :raw_reponse,
                :json_response,
                :response_status

  PARENT_PATH = '/v1/me'

  def initialize(options)
    @access_token = options[:access_token]
  end

  # /me/account
  def account
    @path = PARENT_PATH + '/account'
    connection = Rhapsody::FaradayConnection.prepare_authorization(access_token)
    @raw_reponse = connection.get(@path)
    @json_response = JSON.parse(@raw_response.env[:body])
    @response_status = @raw_response.env[:status]
    member = Rhapsody::Member.new(@json_response)
  end
end

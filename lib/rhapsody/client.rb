class Rhapsody::Client
  attr_accessor :api_key,
                :api_secret,
                :redirect_uri,
                :username,
                :password,
                :auth_code,
                :authentication

  def initialize(options)
    # TODO: verify options
    options.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end

  def password_grant
    @authentication = Rhapsody::Authentication.new({ client: self })
    @authentication.password_grant
  end

  def authorization_url
    Rhapsody::Request::HOST_URL + "/oauth/authorize?client_id=#{@api_key}&redirect_uri=#{@redirect_uri}&response_type=code"
  end

  def connect
    @authentication = Rhapsody::Authentication.new({ client: self })
    @authentication.connect
  end

  def renew
    if @authentication
      @authentication.renew
    end
    # TODO Need to handle, authentication
  end
end

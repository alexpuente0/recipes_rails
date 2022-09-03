module AuthHelper
  def http_login
    email = 'email@example.com'
    pw = 'password'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(email,pw)
  end  
end
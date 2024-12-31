class AuthenticationController < ApplicationController
  skip_before_action :authenticate

  def login
    user = User.find_by(username: params[:username])
    authenticated_user = user&.authenticate(params[:password])

    if authenticated_user
      token = JsonWebToken.encode(user_id: user.id)
      expires_at = Time.at(JsonWebToken.decode(token)[:exp]).iso8601

      render json: { token: token, expires_at: expires_at }, status: :ok
    else
      render json: { error: "Unauthorized: Invalid username or password" }, status: :unauthorized
    end
  rescue JWT::DecodeError => e
    render json: { error: "Token decoding failed: #{e.message}" }, status: :unprocessable_entity
  end
end

class ApplicationController <  ActionController::API

  include JsonWebToken
   before_action :authentication_request

   private

   def authentication_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header

      if (header.nil?)
        render json: { error: 'Unauthorized' }, status: :unauthorized
      else
        begin
          decoded = jwt_decode(header)
          @current_user_id = User.find(decoded[:user_id])
        rescue JWT::ExpiredSignature
          render json: { error: 'Unauthorized. Expired token' }, status: :unauthorized
        rescue JWT::DecodeError
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
   end
end

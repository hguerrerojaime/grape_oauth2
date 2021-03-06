module Twitter
  module Endpoints
    class CustomAuthorization < ::Grape::API
      helpers Grape::OAuth2::Helpers::OAuthParams

      namespace :oauth do
        params do
          use :oauth_authorization_params
        end

        post :custom_authorize do
          response = Grape::OAuth2::Generators::Authorization.generate_for(env) do |request, response|
            request.unsupported_response_type!
          end

          # Status
          status response.status

          # Body
          body response.body
        end
      end
    end
  end
end

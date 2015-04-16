require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class UCCCPD < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :ucccpd

      option :client_options, {
        :site => "https://test.ccpd.uc.edu",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info['id'] }

      info do
        {
          name: raw_info['certname'],
          email: raw_info['default_email']['email_address'],
          first_name: raw_info['firstname'],
          last_name: raw_info['lastname'],
          image: raw_info['profile_photo_url'],
          display_name: raw_info['display_name']
        }
      end

      extra do
        {'raw_info' => raw_info}
      end

      # def token_params
      #   options.token_params.merge(options_for('token'))
      # end

      def raw_info
        @raw_info ||= access_token.get('/api/me', :headers => {'Accept' => "application/json; version=1" }).parsed['payload']['user'] || {}
      end

      # def build_access_token
      #   super
      # end

      # def basic_auth_header
      #   "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      # end
    end
  end
end

OmniAuth.config.add_camelization 'ucccpd', 'UCCCPD'

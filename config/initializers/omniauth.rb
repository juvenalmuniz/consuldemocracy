OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid, 
            Rails.application.secrets.keycloak_openid_key,
            Rails.application.secrets.keycloak_openid_secret,
            client_options: {
              site: Rails.application.secrets.keycloak_openid_url, 
              realm: Rails.application.secrets.keycloak_openid_realm
            },
    name: 'keycloak_openid'
end

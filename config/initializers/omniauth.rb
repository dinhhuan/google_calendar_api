    OmniAuth.config.logger = Rails.logger
     
    Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '1088509694720-ak1rtjadc08ppam0aa4aesncq6co51ml.apps.googleusercontent.com', 'oAKxw3IarzpGDk6ATjDMyAno', 
      { access_type: 'offline',scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar'}
    end
module Credentials
    def self.get(*var_name, default: nil, root: false)
      credentials = Rails.application.credentials
      credentials = credentials[Rails.env.to_sym] unless root
      return default unless credentials
      return credentials if var_name.empty?
      credentials.dig(*var_name) || default
    end
  end
  
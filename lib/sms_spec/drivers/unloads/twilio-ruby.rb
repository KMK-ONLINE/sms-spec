module Twilio
  module REST
    class Client
      alias_method :initialize_from_driver, :initialize
      alias_method :initialize,             :initialize_original

      alias_method :account_from_driver, :account
      alias_method :account,             :account_original

      remove_const :Messages
      remove_const :Account
    end
  end
end

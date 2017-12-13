module Twilio
  module REST
    class Api
      class Messages
        include SmsSpec::Helpers

        def create(opts={})
          to = opts[:to]
          body = opts[:body]
          from = opts[:from]
          add_message SmsSpec::Message.new(:number => to, :from => from, :body => body)
        end
      end

      class Account
        def sms
          Sms.new
        end

        def messages
          Messages.new
        end
      end

      alias_method :account_original, :account
      def account
        account = Account.new
        account.class.send(:define_method, :sid, lambda { $account_sid })
        account
      end
    end

    class Client
      alias_method :initialize_original, :initialize
      def initialize(account_sid, auth_token)
        $account_sid = account_sid
      end
    end
  end
end

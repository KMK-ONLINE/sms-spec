require 'rspec'
require "sms_spec/version"
require "sms_spec/helpers"
require "sms_spec/data"
require "sms_spec/message"
require "sms_spec/util"
require "sms_spec/mobile_device"
require "sms_spec/matchers"

module SmsSpec
  def self.driver=(driver_sym)
    load "sms_spec/drivers/#{driver_sym.to_s}.rb"
  end

  def self.unload_driver=(driver_sym)
    load "sms_spec/drivers/unloads/#{driver_sym.to_s}.rb"
  end
end

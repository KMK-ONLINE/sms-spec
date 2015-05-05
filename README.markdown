# SMS Spec

[![Build Status](https://travis-ci.org/manlycode/sms-spec.svg)](https://travis-ci.org/manlycode/sms-spec)
[![Code Climate](https://codeclimate.com/github/manlycode/sms-spec/badges/gpa.svg)](https://codeclimate.com/github/manlycode/sms-spec)

An RSpec DSL and Cucumber steps to test SMS interactions with your
Ruby on Rails application.

Currently this gem only supports testing SMS messaging using the
[twilio-ruby](https://github.com/twilio/twilio-ruby) and
[lookout-clickatell](https://github.com/lookout/clickatell) gem.

##Setup
Add the sms-spec gem to your Gemfile:
<pre>
group :test do
  gem 'sms-spec'
end
</pre>

## RSpec
In your spec_helper.rb file configure a driver and include helper and matcher
methods.

<pre>
require 'sms_spec'

Spec::Runner.configure do |config|
  config.include(SmsSpec::Helpers)
  config.include(SmsSpec::Matchers)
end
</pre>

To safely use this gem without overriding twilio globally, assign the driver on
the test file you would like to use with the proper context, and safely unload
the driver, current available safe unloading only exists for twilio-ruby.

<pre>
before(:all) do
  SmsSpec.driver = :'twilio-ruby' #this can be any available sms-spec driver
end

after(:all) do
  SmsSpec.unload_driver = :'twilio-ruby'
end
</pre>

## Cucumber
Add the folloing to you env.rb file:

<pre>
require 'sms_spec'
require 'sms_spec/cucumber'
</pre>

This loads the sms_spec RSpec helpers into your cucumber wold. Then,
run the following to generate the text_messsage_steps.rb file:

<pre>
rails generate sms_spec:steps
</pre>

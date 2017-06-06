require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

begin
  # Wrap in a begin/end block so it doesn't crash when Gemfile doesn't have
  # awesome_print
  require 'awesome_print'
  AwesomePrint.irb!
  AwesomePrint.pry!
rescue LoadError
end

begin
  # Wrap in a begin/end block so it doesn't crash when Gemfile doesn't have
  # hirb
  require 'hirb'
  Hirb.enable
rescue LoadError
end

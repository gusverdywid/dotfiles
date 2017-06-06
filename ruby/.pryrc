require 'irb'
load '~/.irbrc'

begin
  # Wrap in a begin/end block so it doesn't crash when Gemfile doesn't have
  # hirb
  require 'hirb'
  Hirb.enable
  old_print = Pry.config.print
  Pry.config.print = proc do |*args|
    Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
  end
rescue LoadError
end

begin
  # Wrap in a begin/end block so it doesn't crash when Gemfile doesn't have
  # awesome_print
  require 'awesome_print'
  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
  end
rescue LoadError
end


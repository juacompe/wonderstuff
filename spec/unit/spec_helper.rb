require 'chefspec'

RSpec.configure do |c|
    c.before :all do
        c.os = backend(Serverspec::Commands::Base).check_os
    end
end

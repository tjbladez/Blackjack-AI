require 'rubygems'
require 'riot'

def require_local_lib(pattern)
  Dir.glob(File.join(File.dirname(__FILE__), pattern)).each {|f| require f }
end

require 'lib/basic_strategy.rb'
require 'lib/hand.rb'
require 'lib/player.rb'
require_local_lib('lib/*.rb')
require_local_lib('extensions/*.rb')
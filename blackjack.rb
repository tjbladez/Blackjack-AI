require 'rubygems'
require 'riot'

def require_local_lib(pattern)
  Dir.glob(File.join(File.dirname(__FILE__), pattern)).each {|f| require f }
end

require_local_lib('lib/*.rb')
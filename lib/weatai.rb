files = Dir.glob(File.join(File.dirname(__FILE__), 'weatai/*.rb'))
files.each { |lib| require_relative lib }
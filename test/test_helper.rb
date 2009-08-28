require 'test/unit'

begin
  Dir.glob(File.join(File.dirname(__FILE__), '..', 'src', '**')).each do |f|
    require f
  end
rescue LoadError => lE
  raise "Failed to load source. Underlying error: #{lE}"
end

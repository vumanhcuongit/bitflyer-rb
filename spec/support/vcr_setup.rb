require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock # or :fakeweb
  c.ignore_localhost = true
  c.debug_logger = File.open("vcr.log", "w")
  c.allow_http_connections_when_no_cassette = true
  c.filter_sensitive_data("<KEY>") { ENV["KEY"] }
  c.filter_sensitive_data("<SECRET>") { ENV["SECRET"] }
end

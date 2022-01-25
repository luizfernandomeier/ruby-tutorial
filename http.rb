require 'net/http'
require 'open-uri'

h = Net::HTTP.new('www.google.com', 80) # can't use the prefix 'http' here
r = h.get('/')
if r.code == '200'
  puts r.body.scan(/<title>(.*)<\/title>/)
end

# open('http://www.google.com/') do |f| # deprecated
URI.open('https://www.ruby-lang.org') do |f| # TODO: handles redirects? it doesn't seem to work with amazon.com
  puts f.read.scan(/<title>(.*)<\/title>/)
end

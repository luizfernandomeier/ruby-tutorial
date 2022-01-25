require 'net/http'

pages = ["www.google.com", "www.ruby-lang.org"]
threads = []
puts "Thread Id: #{Thread.current.object_id} - PID: #{Process.pid}"
pages.each do |page|
  threads << Thread.new(page) do |url| # receives the page to create a thread variable instance
    puts "Thread Id: #{Thread.current.object_id} - PID: #{Process.pid}"
    h = Net::HTTP.new(url, 80)
    puts "Thread Id: #{Thread.current.object_id} - Fetching: #{url}"
    r = h.get('/')
    puts "Thread Id: #{Thread.current.object_id} - Got: #{r.code}"
  end
end
threads.each{|t| t.join}

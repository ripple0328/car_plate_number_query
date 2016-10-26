#!/usr/bin/env ruby
require 'net/https'
require 'uri'
require 'open-uri'

def get_number(url)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)

  request.set_form_data('cxyzm' => true)

  response = http.request(request)
  if response.body.force_encoding('ASCII-8BIT').chars.first == '0'
    return true
  else
    return false
  end
end

results = []
res = ''
char1 = char2 = ('A'..'Z').to_a.reject{ |a| a == 'I' or a == 'O' }
char3 = char4 = char5 = (1..9).to_a.reject{ |a| a == 4 }.flatten

# char1.each do |n1|
  n1 = 'Q'
    char3.each do |n2|
      # char2.each do |n3| 
      # n3 = (n1.ord + 1).chr

        n3 = 'B'

      

      a = "#{n1}#{n2}#{n3}#{n2}#{n2}"
      p a
          res = "http://117.36.53.122:9085/zzxh/business/BusinessAction.do?actiontype=xhgzvalidate&clsbdh=LFPM4ACP0F1A42128&timeStamp=1435046445480&hpzl=02&hphm1=A&hphm2=#{n1}&hphm3=#{n2}&hphm4=#{n3}&hphm5=#{n2}&hphm6=#{n2}"

          next unless get_number(res)
          p "#----:#{a}"
          system("echo #{a}>> numbers.txt")
          results << a
      # end
      # end
end

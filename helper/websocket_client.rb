require 'em-http'

class WebSocketClient

  def start

    EventMachine.run do

      puts '='*80, "Connecting to websockets server at ws://0.0.0.0:8000", '='*80

      http = EventMachine::HttpRequest.new("ws://0.0.0.0:8000/websocket").get :timeout => 0

      http.errback do
        puts "oops, error"
      end

      http.callback do
        puts "#{Time.now.strftime('%H:%M:%S')} : Connected to server"
      end

      http.stream do |msg|
        puts msg
      end

    end
    
  end

end
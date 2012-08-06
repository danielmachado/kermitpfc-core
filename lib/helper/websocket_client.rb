require 'em-http'

# @author Daniel Machado Fernandez
# @version 1.0
#
# A WebSocket client to help testing the WebSocket Server
class WebSocketClient

  # Starts the WebSocket client to consume the published info in the WebSocket Server
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
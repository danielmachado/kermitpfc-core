require 'em-http'
require_relative '../logging'

# @author Daniel Machado Fernandez
# @version 1.0
#
# A WebSocket client to help testing the WebSocket Server
class WebSocketClient

  include Logging

  # Starts the WebSocket client to consume the published info in the WebSocket Server
  def start

    EventMachine.run do

      puts '='*80, "Connecting to websockets server at ws://#{Settings.websocket.host}:#{Settings.websocket.port}", '='*80

      http = EventMachine::HttpRequest.new("ws://#{Settings.websocket.host}:#{Settings.websocket.port}/websocket").get :timeout => 0

      http.errback do
        logger.error "something was wrong in the websocket_client"
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
require 'redis'
require 'em-websocket'

require_relative '../logging'

# WebSocket clients array
SOCKETS = []

# @author Daniel Machado Fernandez
# @version 1.0
#
# WebSocket Server where the USMF messages will be published
class WebSocketServer

  include Logging

  # Configures the WebSocket to works in test mode (path controversia)
  def initialize

    logger.info("Starting WebSocketServer...")
  
  end
  
  # Starts the Websocket server and listen the new clients to broadcast the messages
  def start
    @redis = Redis.new(:host => "#{Settings.redis.host}", :port => Settings.redis.port)

    
    Thread.new do
      EventMachine.run do
      	puts '='*80, "Starting websockets server at ws://#{Settings.websocket.host}:#{Settings.websocket.port}", '='*80
        
        EventMachine::WebSocket.start(:host => "#{Settings.websocket.host}", :port => Settings.websocket.port) do |ws|
          ws.onopen do
            
            puts "#{Time.now.strftime('%H:%M:%S')} : Client connected", '-'*80
            SOCKETS << ws
          end

          ws.onclose do
            
            puts "#{Time.now.strftime('%H:%M:%S')} : Client disconnected", '-'*80
            SOCKETS.delete ws
          end
        end
      end
    end

    
    Thread.new do
      @redis.subscribe('ws') do |on|
        
        on.message do |chan, msg|
        
         puts "#{msg}"
         SOCKETS.each {|s| s.send msg} 
        
        end
      end
    end

    sleep
    
  end
end  
require 'redis'
require 'em-websocket'
require 'logger'

SOCKETS = []

class WebSocketServer

  def initialize(test='default')
    if(test=='default')
          @logger = Logger.new('./log/log.txt','monthly')
    else
          @logger = Logger.new('../log/log.txt','monthly')
    end

    @logger.info("Starting WebSocketServer...")
  
  end
  
  def start
    @redis = Redis.new(:host => '127.0.0.1', :port => 6379)

    
    Thread.new do
      EventMachine.run do
      	puts '='*80, "Starting websockets server at socket://0.0.0.0:8000", '='*80
        
        EventMachine::WebSocket.start(:host => '0.0.0.0', :port => 8000) do |ws|
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
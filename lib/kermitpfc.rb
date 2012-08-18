require_relative 'business/adapter/twitter_adapter'
require_relative 'business/converter/twitter_converter'
require_relative 'business/converter/random_converter'
require_relative 'business/adapter/random_adapter'
require_relative 'helper/DAO'
require_relative 'helper/websocket_server'
require_relative './logging'
require 'json'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Masterclass that adapts the rakefile into a class to use the commander gem
# @see http://rubydoc.info/gems/commander/4.1.2/frames
class KermitPFC

  # Load the config file
  def initialize
    
    begin

      cleaning_the_house
      
      puts 'pooling'
      
      pool = []
      pool << Thread.new { initialize_websocket_server }
      
      puts 'websocket started'

      for i in 1..Logging::Settings.twitter.streams

        puts "adding twitter adapter ##{i}"
        pool << Thread.new { twitter_adapter i }
        sleep 1

      end

      puts 'twitter adapters added'

      if Logging::Settings.rpg
      
        pool << Thread.new { random_adapter }
        puts 'random adapter added'
      
        pool << Thread.new { random_converter }
        puts 'random converter added'
      
      end

      pool << Thread.new { twitter_converter }
      puts 'twitter converter added'

      pool.each do |thread|
        thread.join
      end

    rescue Exception => e
      
      Logging::logger.error(e)

      pool.each do |thread|
        Thread.kill(thread)
      
      end

    end

  end

  # Deletes the db keys previously used
  def cleaning_the_house

    dao = DAO.new
    dao.clean

  end

  # Starts the WebSocket Server
  def initialize_websocket_server

    ws = WebSocketServer.new
    ws.start

  end

  # Starts the Twitter Adapter
  #
  # @param stream [Integer] the number of the stream
  def twitter_adapter stream

    ta = TwitterAdapter.new
    ta.connect_stream stream

  end

  # Starts the Random Adapter
  #
  # @param stream [Integer] the number of the stream
  def random_adapter stream=1

    ra = RandomAdapter.new
    ra.connect_stream stream

  end

  # Starts the Twitter Converter
  def twitter_converter

    dao = DAO.new 'twitter'

    while true

      status = dao.get_status
      puts 'Status retrieved'

      while status != nil

        tc = TwitterConverter.new
        usmf = tc.to_usmf status

        dao.publish usmf.to_hash.to_json
        puts 'Published'

        status = dao.get_status

      end

      puts 'All the statuses were been sent'
      sleep 2

    end

  end

  # Starts the Random Converter
  def random_converter

    dao = DAO.new 'rpg'

    while true

      status = dao.get_status
      puts 'Status retrieved'

      while status != nil

        rc = RandomConverter.new
        usmf = rc.to_usmf status

        dao.publish usmf.to_hash.to_json
        puts 'Published'

        status = dao.get_status

      end

      puts 'All the statuses were been sent'
      sleep 2

    end

  end
end
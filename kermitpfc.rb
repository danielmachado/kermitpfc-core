require_relative './business/adapter/twitter_adapter'
require_relative './business/converter/twitter_converter'
require_relative './business/converter/random_converter'
require_relative './business/adapter/random_adapter'
require_relative './helper/DAO'
require_relative './helper/websocket_server'
require 'json'
require 'yaml'


class KermitPFC

  def initialize

    config = YAML::load( File.open( 'config.yml' ) )
    
    
    begin
    
      pool = []
      pool << Thread.new { initialize_websocket_server }

      for i in 1..config["twitter"]["streams"]

        pool << Thread.new { twitter_adapter i;  }

      end

      pool << Thread.new { twitter_converter }

      pool.each do |thread|
        thread.join
      end

    rescue Exception => e
      
      pool.each do |thread|
        Thread.kill(thread)
      end

    end

  end

  def initialize_websocket_server

    ws = WebSocketServer.new
    ws.start

  end

  def twitter_adapter stream

    ta = TwitterAdapter.new
    ta.connect_stream stream

  end

  def random_adapter stream

    ra = RandomAdapter.new
    ra.connect_stream stream

  end

  def twitter_converter

    dao = DAO.new 'twitter'

    while true

      status = dao.get_status
      puts 'Status retrieved'

      while status != nil

        tc = TwitterConverter.new
        usmf = tc.to_usmf status

        dao.publish usmf.to_hash.to_json
        puts 'Publishing'

        status = dao.get_status

      end

      puts 'All the statuses were been sent'
      sleep 10

    end

  end

  def random_converter

    dao = DAO.new 'random'

    while true

      status = dao.get_status
      puts 'Status retrieved'

      while status != nil

        rc = RandomConverter.new
        usmf = rc.to_usmf status

        dao.publish usmf.to_hash.to_json
        puts 'Publishing'

        status = dao.get_status

      end

      puts 'All the statuses were been sent'
      sleep 10

    end

  end
end

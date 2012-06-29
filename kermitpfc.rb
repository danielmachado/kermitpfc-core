require_relative './business/adapter/twitter_adapter'
require_relative './business/converter/twitter_converter'
require_relative './business/converter/random_converter'
require_relative './business/adapter/random_adapter'
require_relative './helper/DAO'
require_relative './helper/websocket_server'
require 'json'

class KermitPFC

  def initialize_websocket_server

    ws = WebSocketServer.new
    ws.start

  end

  def twitter_adapter

    ta = TwitterAdapter.new
    ta.connect_stream

  end

  def random_adapter

    ra = RandomAdapter.new
    ra.connect_stream

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

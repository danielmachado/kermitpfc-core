# @author Daniel Machado Fernandez
# @version 1.0
# 
# Loads the config file, the logger and the KermitPFC masterclass
module Logging

  require 'yaml'
  require 'logger'
  require_relative './kermitpfc'
  require_relative './helper/settings'

  # its neccessary to build the gem and make it run
  KermitPFC = ::KermitPFC

  # offers the logger to the app
  # @return [Logger] the logger 
  def logger
    Logging.logger
  end

  # solve the problem with path controversia in the log file
  # @return [Logger] the logger with the correct path of log.txt
  def self.logger 
    begin
	   @logger ||= Logger.new('../log/log.txt','monthly')
    rescue
      @logger ||= Logger.new('./log/log.txt','monthly')
    end
  end
  
end
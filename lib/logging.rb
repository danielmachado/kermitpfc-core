# @author Daniel Machado Fernandez
# @version 1.0
# 
# Loads the config file, the logger and the KermitPFC masterclass
module Logging

  require 'yaml'
  require 'logger'
  require_relative './kermitpfc'

  # its neccessary to build the gem and make it run
  KermitPFC = ::KermitPFC

  # offers the logger to the app
  # @return [Logger] the logger 
  def logger
    Logging.logger
  end

  # offers the config file to the app
  # @return [File] the YAML file to config the app
  def config
  	Logging.config
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

  # solve the problem with path controversia in the config file
  # @return [File] the yaml file with the correct path of config.yml
  def self.config
    begin
  	  @config = YAML::load( File.open( '../config/config.yml' ) )
    rescue
      @config = YAML::load( File.open( './config/config.yml' ) )
    end
  end
  
end
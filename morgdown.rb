#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "optparse"
require 'constant'
require 'pp'

class Core

  def initialize()
    
    
  end
  
end


class Exporter

  ORG = :ORG
  MARKDOWN = :MARKDOWN
  HTML = :HTML

  # enum_const_set %w[
  #   ORG
  #   MARKDOWN
  #   HTML
  # ]
  
  
end



class Command
  attr_reader :option
  
  def initialize(argv)
    @argv = argv
    @option = { }
    @option[:format] = Exporter::ORG # default
  end

  def parse()
    opt = OptionParser.new
    
    opt.on('-i FILE','--input FILE','XMind file for input') {|v| @option[:file_input] = v }
    opt.on('-o FILE','--output FILE','Filename of output') {|v| @option[:file_output] = v }
    opt.on('-c FILE','--config FILE','Config file for output') {|v| @option[:file_config] = v }
    
    # format
    opt.on('-f FORMAT','--format FORMAT','Output format: "org" [default] / "md" or "markdown" / "html"') {|v| 
      case v
      when "org"
        @option[:format] = Exporter::ORG
      when "md", "markdown"
        @option[:format] = Exporter::MARKDOWN
      when "html"
        @option[:format] = Exporter::HTML
      end
    }

    # help
    opt.on( '-h', '--help', 'Display this screen' ) do
      puts opt
      exit
    end

    #実際にオプションをパースする。 #存在しないオプションでは例外が飛ぶので捕捉する。
    begin
      opt.parse!(@argv)
    rescue
      puts "ERROR"
      puts opt
      # exit
    end
    
  end
  
end


## main
if __FILE__ == $PROGRAM_NAME

  command = Command.new(ARGV)

  command.parse()

  print 'option: '
  pp command.option
  
end

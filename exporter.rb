#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'pp'
require 'pandoc-ruby'

module XMOrgDown
  # Export a HTML to any filetypes with Pandoc
  class Exporter
    attr_reader :result
    attr_accessor :html

    def initialize(option, html='')
      @html = html
      @option = option
      @result = ''
    end

    def export()
      @converter = PandocRuby.new(@html,
                                  :standalone, 
                                  :from => @option[:format_from],
                                  :to => @option[:format_to])
      @result = @converter.convert
      return @result
    end

  end
  
end

## main
if __FILE__ == $PROGRAM_NAME
  option = { }
  option[:format_from] = 'html' # fixed
  option[:format_to] = 'markdown' # default
  
  File.open("data/12.07.16_MOrgDown_idea/content.html") do |f|
    exporter = XMOrgDown::Exporter.new(option, f.read)
    exporter.export()
    puts exporter.result
    
  end
  
end
  

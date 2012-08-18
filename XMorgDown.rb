#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "optparse"
require 'pp'

module XMorgDown

  DEBUG = true

  class Core

    def initialize()
      
    end

    def parse()
      
    end

    def export()
      
    end
  end


  class Exporter
    attr_reader :html

    def initialize(html)
      @html = html
    end

  end



  class Command
    attr_reader :option,:argv
    
    def initialize(argv)
      @argv = argv
      @option = { }
      @option[:format_from] = 'html' # fixed
      @option[:format_to] = 'markdown' # default
      @option[:file_input] = ''
      @option[:file_output] = ''
    end

    # Parse command line options
    def parse()
      # Option Parser of optparse
      opt = OptionParser.new
      script_name = File.basename($0)
      opt.banner = "Usage: ruby #{script_name} [options] input.xmind"
      
      #
      # Option Settings
      #
      
      # Output
      opt.on('-o FILE','--output FILE','Output Filename') {|v| @option[:file_output] = v }
      
      # Format(Output)
      output_formats_short = %w(markdown[default] org html latex rst plain)
      output_formats_long = %w(native json html html5 html+lhs html5+lhs s5 slidy slideous dzslides docbook opendocument latex latex+lhs beamer beamer+lhs context texinfo man markdown markdown+lhs plain rst rst+lhs mediawiki textile rtf org asciidoc odt docx epub)
      str_output_formats = "Output formats: " + output_formats_short.join(', ') + ", ... \n\t\t\t\t\t(for other formats: see pandoc --help)"
      
      opt.on('-t FORMAT','--to=FORMAT',str_output_formats) {|v| @option[:format_to] = v }
      opt.on('-w FORMAT','--write=FORMAT',str_output_formats) {|v| @option[:format_to] = v }

      # Help
      opt.on( '-h', '--help', 'Display this screen' ) do
        puts opt
        exit
      end

      
      # Do parsing
      begin
        pp @argv if DEBUG
        opt.permute!(@argv)
      rescue => e
        # Catch exception when an option is wrong
        puts opt
        abort(e)
      end

      ## Check whether ARGV is null
      if @argv.length == 0
        # Show help
        puts opt
        exit
      end
      
      @option[:file_input] = @argv.pop

      ## Check whether the filename ends with ".xmind"
      if not (@option[:file_input] =~ /^.*\.xmind$/)
        puts opt
        abort("ERROR: filename should end with \".xmind\"")
      end
      
      # Check format
      if not output_formats_long.include?(@option[:format_to])
        puts opt
        abort("ERROR: wrong output format: "+ @option[:format_to])
      end
      
      
    end
    
  end
end


## main
if __FILE__ == $PROGRAM_NAME

  command = XMorgDown::Command.new(ARGV)

  command.parse()
  
  # (debug) Confirm options
  if XMorgDown::DEBUG
    print 'option: '
    pp command.option
  end
  
end

#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "optparse"
require 'pp'

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

  ORG = :ORG
  MARKDOWN = :MARKDOWN
  HTML = :HTML

  def initialize(html)
    @html = html
  end

end



class Command
  attr_reader :option
  
  def initialize(argv)
    @argv = argv
    @option = { }
    @option[:format] = Exporter::MARKDOWN # default
    @option[:format_from] = 'html' # fixed
    @option[:format_to] = 'markdown' # default
    @option[:file_input] = ''
    @option[:file_output] = ''
  end

  # Parse command line options
  def parse()
    @option[:file_input] = @argv.pop

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
    
    str_output_formats = "Output formats: " + output_formats_short.join(', ') + ", ... (for other formats: see pandoc --help)"
    
    opt.on('-t FORMAT','--to=FORMAT',str_output_formats) {|v| @option[:format_to] = v }
    opt.on('-w FORMAT','--write=FORMAT',str_output_formats) {|v| @option[:format_to] = v }
    
    
    # Help
    opt.on( '-h', '--help', 'Display this screen' ) do
      puts opt
      exit
    end

    
    # Do parsing
    begin
      opt.parse!(@argv)
    rescue => e
      # Catch exception when an option is wrong
      puts opt
      abort(e)
    end
    
    ## Check whether the filename ends with ".xmind"
    if not (@option[:file_input] =~ /^.*\.xmind$/)
      puts opt
      abort("ERROR: filename should end with \".xmind\"")
    end
    
    
  end
  
end


## main
if __FILE__ == $PROGRAM_NAME

  command = Command.new(ARGV)

  command.parse()
  
  # (debug) Confirm options
  if DEBUG
    print 'option: '
    pp command.option
  end
  
end

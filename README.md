# XMorgDown
Exports XMind Mindmap to any documents with Pandoc.

version: 0.1  
date: August 19, 2012

## Requirement
* Ruby 1.9.3 or above
	* Use of rvm is recommended
* Pandoc 1.9.4.2 or above
	* See installation: <http://johnmacfarlane.net/pandoc/installing.html>
	* You can choose either:
		* cabal install (with Haskell Platform, I prefer personally) or		* Pandoc Package Installer (without Haskell Platform)
* Nokogiri (XML Parser for Ruby)
	* See installation: <http://nokogiri.org/tutorials/installing_nokogiri.html>
	* homebrew 0.9 has some problems: read the URL above carefully.



## Usage

	Usage: ruby XMorgDown.rb [options] input.xmind
    -o, --output FILE                Output Filename
    -t, --to=FORMAT                  Output formats: markdown, org, html, latex, rst,  ... 
    -w, --write=FORMAT               Output formats: markdown, org, html, latex, rst,  ... 
        --pandoc-options=OPTIONS     Pandoc options (Use double quotes like "--atx-headers")
    -h, --help                       Display this screen

* For detail of formats and Pandoc options: See [Pandoc User's Guide](http://johnmacfarlane.net/pandoc/README.html)
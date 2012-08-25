# XMorgDown
Exports XMind Mindmap to any documents with Pandoc.

Date: August 19, 2012  
Copyright (c) 2012 Yuki Fujiwara \<sky.y.0079@gmail.com\>


* XMind (English): <http://www.xmind.net/>
* XMind (Japanese): <http://jp.xmind.net/>
	* **CAUTION for Japanese**: XMind 2012 (New Version) currently has a problem of Japanese input. Use XMind 3.2 (from Japanese site) for a while.


## Requirement
* Ruby 1.9.3 or above
	* Use of rvm is recommended
* Pandoc 1.9.4.2 or above
	* See installation: <http://johnmacfarlane.net/pandoc/installing.html>
	* You can choose either:
		* cabal install (with Haskell Platform, I prefer personally) or
		* Pandoc Package Installer (without Haskell Platform)
* Nokogiri (XML Parser for Ruby)
	* See installation: <http://nokogiri.org/tutorials/installing_nokogiri.html>
	* homebrew 0.9 has some problems: read the URL above carefully.
* zipruby (<https://bitbucket.org/winebarrel/zip-ruby/wiki/Home>)
	* Install with: `gem install zipruby`


## Usage

	Usage: ruby XMorgDown.rb [options] input.xmind
    -o, --output FILE                Output Filename
    -t, --to=FORMAT                  Output formats: markdown, org, html, latex, rst,  ... 
    -w, --write=FORMAT               Output formats: markdown, org, html, latex, rst,  ... 
        --pandoc-options=OPTIONS     Pandoc options (Use double quotes like "--atx-headers")
    -h, --help                       Display this screen

* For detail of formats and Pandoc options: See [Pandoc User's Guide](http://johnmacfarlane.net/pandoc/README.html)


## Examples
Sample files are in `samples/` directory.

### Example 1 (Japanese: 寿限無)
	ruby XMorgDown.rb -t markdown -o test1.md samples/test1.xmind --pandoc-options="--atx-headers"

* It makes a file "test1.md" as in Markdown (ATX-headered) style.

#### Example files

* Original XMind file: test1.xmind (test1.png as image)
* Sample Result (Org File): test1.org
* Sample Result (Markdown File): test1.md
* "--atx-headers": use `#` and `##` as `<h1>` and `<h2>` header output 


### Example 2 (English: Lorem Ipsum)
	ruby XMorgDown.rb -t org -o test2.org samples/test2.xmind

* It makes a file "test2.org" in Org style.

#### Example files

* Original XMind file: test2.xmind (test2.png as image)
* Result (Org File): test2.org
* Result (Markdown File): test2.md


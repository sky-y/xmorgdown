# XMorgDown
[XMind](http://jp.xmind.net/)のマインドマップ(.xmind)をPandoc経由でいろんなドキュメント形式に変換するRubyスクリプトです。

* 対応ソフト：XMind 3.2(日本語版): <http://jp.xmind.net/>
	* **注意**: XMind 2012 (最新版) は日本語入力の面でバグがあります。当面はXMind 3.2を使用してください。
	
## このドキュメントについて
今後、英語版 `README.md` を優先して編集します。

もし内容が大きく食い違う場合は、`README.md`の方に従ってください。

## Pandocで出力できるドキュメント形式

	HTML formats: XHTML, HTML5, and HTML slide shows using Slidy, Slideous, S5, or DZSlides.
	Word processor formats: Microsoft Word docx, OpenOffice/LibreOffice ODT, OpenDocument XML
	Ebooks: EPUB
	Documentation formats: DocBook, GNU TexInfo, Groff man pages
	TeX formats: LaTeX, ConTeXt, LaTeX Beamer slides
	PDF via LaTeX
	Lightweight markup formats: Markdown, reStructuredText, AsciiDoc, MediaWiki markup, Emacs Org-Mode, Textile



## 必要なライブラリ・ソフトなど
* Ruby 1.9.3 以上
	* rvmの使用をおすすめします
* Pandoc 1.9.4.2 以上
	* インストール方法はこちらを参照： <http://johnmacfarlane.net/pandoc/installing.html>
	* いずれかの方法でインストールできます：
		* cabal を使ったインストール (Haskell Platform使用、個人的におすすめ) or
		* Pandoc Package Installer (Haskell Platform不使用)
* Nokogiri (Ruby用XMLパーサ)
	* インストール方法はこちらを参照： <http://nokogiri.org/tutorials/installing_nokogiri.html>
	* homebrew 0.9 は問題があるので、上記のURLを読んでください：
* zipruby (<https://bitbucket.org/winebarrel/zip-ruby/wiki/Home>)
	* 以下のコマンドでインストール： `gem install zipruby`
	* rvm使用時に動作しない場合は、rvmのバージョンをよく確認してください


## 使い方

	$ ruby XMorgDown.rb [options] input.xmind
    -o, --output FILE                出力ファイル名
    -t, --to=FORMAT                  出力フォーマット: markdown, org, html, latex, rst,  ... 
    -w, --write=FORMAT               同上
        --pandoc-options=OPTIONS     Pandocのその他のオプション ("--atx-headers"のように二重引用符でくくってください)
    -h, --help                       簡単なヘルプ

* フォーマットとPandocのオプションについては以下を参照： [Pandoc User's Guide](http://johnmacfarlane.net/pandoc/README.html)


## 使用例
サンプルファイルは`samples/`ディレクトリにあります。

### Example 1 (寿限無)
	ruby XMorgDown.rb -t markdown -o test1.md samples/test1.xmind --pandoc-options="--atx-headers"

* Markdown形式(ATX-headeredスタイル)の"test1.md"を生成します

#### テスト用ファイル

* 元のXMindファイル: test1.xmind (test1.png as image)
* サンプル出力 (Org File): test1.org
* サンプル出力 (Markdown File): test1.md
* オプション "--atx-headers"の意味： HTMLヘッダ`<h1>`と`<h2>`に相当するMarkdown出力として`#`と`##`を使ったスタイルを使います
	* これを付けない場合は、下線を使ったヘッダ形式がデフォルトになります


### Example 2 (Lorem Ipsum)
	ruby XMorgDown.rb -t org -o test2.org samples/test2.xmind

* Org-modeスタイルの"test2.org"を生成します

#### テスト用ファイル

* 元のXMindファイル: test2.xmind (test2.png as image)
* サンプル出力 (Org File): test2.org
* サンプル出力 (Markdown File): test2.md


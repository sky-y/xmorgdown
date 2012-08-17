require 'test/unit'

require 'XMorgDown'


class TestCommand < Test::Unit::TestCase 
  def setup
    @argv = Array()
    @command = Array()

    # 0: true
    c = %w(ruby morgdown.rb data/12.07.16_MOrgDown_idea.xmind )
    @argv.push(c)
    @command.push(Command.new(c))

    # 1: true
    c = %w(ruby morgdown.rb -f markdown data/12.07.16_MOrgDown_idea.xmind)
    @argv.push(c)
    @command.push(Command.new(c))

    # 2: true
    c = %w(ruby morgdown.rb -f org data/12.07.16_MOrgDown_idea.xmind)
    @argv.push(c)
    @command.push(Command.new(c))

    # 3: false (throw exception)
    c = %w(ruby morgdown.rb -f data/12.07.16_MOrgDown_idea.xmind)
    @argv.push(c)
    @command.push(Command.new(c))
    
    # 4: false (thrown exception)
    c = %w(ruby morgdown.rb data/12.07.16_MOrgDown_idea.xmind -f markdown)
    @argv.push(c)
    @command.push(Command.new(c))

    # 5: true
    c = %w(ruby morgdown.rb -h)
    @argv.push(c)
    @command.push(Command.new(c))

    # 6: true
    c = %w(ruby morgdown.rb -f org -o test.org data/12.07.16_MOrgDown_idea.xmind)
    @argv.push(c)
    @command.push(Command.new(c))

    # 7: false (exit with error)
    c = %w(ruby morgdown.rb -f markdown pandoc_help.txt)
    @argv.push(c)
    @command.push(Command.new(c))
    
  end
  
  def test_commands()
    
    # 0: true
    assert_nothing_thrown("0: success (true)") { @command[0].parse() }

    # 1: true
    assert_nothing_thrown("1: success (true)") { @command[1].parse() }

    # 2: true
    assert_nothing_thrown("2: success (true)") { @command[2].parse() }

    # 3: false (throw exception)
    assert_raise("3: success (throw exception)") { @command[3].parse() }
    
    # 4: false (throw exception)
    assert_raise("4: success (throw exception)") { @command[4].parse() }

    # 5: true
    assert_nothing_thrown("5: success (true)") { @command[5].parse() }

    # 6: true
    assert_nothing_thrown("6: success (true)") { @command[6].parse() }

    # 7: false (exit with error)
    assert_raise("7: success (throw exception)") { @command[7].parse() }
    
  end
  
end


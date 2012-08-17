require 'test/unit'

require 'morgdown'


class TestCommand < Test::Unit::TestCase 
  def setup
    argv1 = %w(morgdown.rb -i data/12.07.16_MOrgDown_idea.xmind -o output.md -f md)
    command1 = Command.new(argv1)

    argv2 = %w(morgdown.rb -i data/12.07.16_MOrgDown_idea.xmind -f md)
    command1 = Command.new(argv2)

    
  end
end


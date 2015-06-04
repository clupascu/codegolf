require 'minitest/autorun'

Program = -> {
  # read all lines from STDIN
  input = $<.map{|l|l}.join
  width = input.index(?\n)+1

  box_left_margins = []
  current_layer = -1

  input.size.times{|i|
    c = input[i]
    
    if c == ?+ && input[i+1] == ?-
      #we're at a box's left margin
      if input[i+width] == ?|
        # we're at the box's top - mark this index as a left margin
        box_left_margins << i%width
      else
        # we're at the box's bottom - this index is not longer a left margin
        box_left_margins-=[i%width]
      end
    end

    if c == ?|
      if box_left_margins.include? (i%width)
        current_layer += 1
      else
        current_layer -= 1
      end
    end

    if c == ' '
      $><< ('#=-.'[current_layer]||' ')
    else
      $><<c
    end
  }
}


describe Program do
  def x_test_case_1
    input = <<-EOS
+--------------------------------------------------------------+
|                                                              |
|   +-------------------------------+          +-------+       |
|   |                               |          |       |       |
|   |                               |          |       |       |
|   |     +----------------+        |          |       |       |
|   |     |                |        |          +-------+       |
|   |     |                |        |                          |
|   |     |                |        |          +-------+       |
|   |     +----------------+        |          |       |       |
|   |                               |          |       |       |
|   |                               |          |       |       |
|   +-------------------------------+          +-------+       |
|                                                              |
+--------------------------------------------------------------+
EOS

    expected_output = <<-EOS
+--------------------------------------------------------------+
|##############################################################|
|###+-------------------------------+##########+-------+#######|
|###|===============================|##########|=======|#######|
|###|===============================|##########|=======|#######|
|###|=====+----------------+========|##########|=======|#######|
|###|=====|----------------|========|##########+-------+#######|
|###|=====|----------------|========|##########################|
|###|=====|----------------|========|##########+-------+#######|
|###|=====+----------------+========|##########|=======|#######|
|###|===============================|##########|=======|#######|
|###|===============================|##########|=======|#######|
|###+-------------------------------+##########+-------+#######|
|##############################################################|
+--------------------------------------------------------------+
EOS
    assert_equal expected_output, execute(input)
  end

  def test_case_2
    input = <<-EOS
+-----------------------------------------------------------------------+
|     +--------------------------------------------------------------+  |
|     |      +-----------------------------------------------------+ |  |
|     |      |         +-----------------------------------------+ | |  |
|     |      |         |           +---------------------------+ | | |  |
|     |      |         |           |         +-------------+   | | | |  |
|     |      |         |           |         |             |   | | | |  |
|     |      |         |           |         +-------------+   | | | |  |
|     |      |         |           +---------------------------+ | | |  |
|     |      |         |                                         | | |  |
|     |      |         +-----------------------------------------+ | |  |
|     |      |                                                     | |  |
|     |      |                                                     | |  |
|     |      +-----------------------------------------------------+ |  |
|     |                                                              |  |
|     +--------------------------------------------------------------+  |
|                                                                       |
|                                                                       |
|                                                                       |
+-----------------------------------------------------------------------+
EOS

    expected_output = <<-EOS
+-----------------------------------------------------------------------+
|#####+--------------------------------------------------------------+##|
|#####|======+-----------------------------------------------------+=|##|
|#####|======|---------+-----------------------------------------+-|=|##|
|#####|======|---------|...........+---------------------------+.|-|=|##|
|#####|======|---------|...........|         +-------------+   |.|-|=|##|
|#####|======|---------|...........|         |             |   |.|-|=|##|
|#####|======|---------|...........|         +-------------+   |.|-|=|##|
|#####|======|---------|...........+---------------------------+.|-|=|##|
|#####|======|---------|.........................................|-|=|##|
|#####|======|---------+-----------------------------------------+-|=|##|
|#####|======|-----------------------------------------------------|=|##|
|#####|======|-----------------------------------------------------|=|##|
|#####|======+-----------------------------------------------------+=|##|
|#####|==============================================================|##|
|#####+--------------------------------------------------------------+##|
|#######################################################################|
|#######################################################################|
|#######################################################################|
+-----------------------------------------------------------------------+
EOS
    assert_equal expected_output, execute(input)
  end


  def execute(input)
    capture_stdout(input){ Program[] }
  end
end

# capture STDIN/STDOUT for testing purposes
require 'stringio'
module Kernel
  def capture_stdout(console_input = '')
    $stdin = StringIO.new(console_input)
    out = StringIO.new
    out.set_encoding 'utf-8'
    $stdout = out
    yield
    return out.string
  ensure
    $stdout = STDOUT
    $stdin = STDIN
  end
end

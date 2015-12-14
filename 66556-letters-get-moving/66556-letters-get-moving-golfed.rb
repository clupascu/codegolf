# rubocop: disable all
require 'minitest/autorun'

#146

F=
->s{a=s.chars.map{|c|[c,c=~/[a-z]/i&&c.upcase.ord-64]}
z=a.size
while i=a.index{|c,s|s}
c,s=a.delete_at i
a.insert (i+s)%z,[c,]
end
a.join}

describe :MovingLetters do
  def test_case_1
    assert_equal 'tca', F['cat']
  end

  def test_case_2
    assert_equal '.F.NU', F['F.U.N']
  end

  def test_case_3
    assert_equal 'goD', F['Dog']
  end

  def test_case_4
    assert_equal '*hibey', F['hi*bye']
  end
end

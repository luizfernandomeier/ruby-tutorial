# defines a namespace
# modules allow mixins to extend classes

# in order to resolve ambiguous names, ruby looks first in the immediate class of an object, then in the
# mixins included into that class, and then in superclasses and their mixins

# if a class has multiple modules mixed in, the last one included is searched first

module Debug
  attr_reader :debug
  def initialize
    @debug = "DEBUG"
  end

  def who_am_i?
    "#{self.class.name} (\##{self.object_id}): #{self.to_s}"
  end
end

class A
  include Debug
  def initialize
    @debug = "DEBUG_A"
  end

  def to_s
    "Letter A"
  end
end

class B
  include Debug

  def to_s
    "Letter B"
  end

  def who_am_i?
    "#{super} -- DEBUG_B"
  end
end

# resolving names - order

puts A.new.who_am_i?
puts B.new.who_am_i? # B.who_am_i? overrides Debug.who_am_i?

puts A.new.debug # DEBUG_A overrides DEBUG
puts B.new.debug

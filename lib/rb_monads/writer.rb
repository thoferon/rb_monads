require 'rb_monads/monad'

module RbMonads
  def Writer(value, acc = [])
    WriterClass.return(value, acc)
  end

  class WriterClass
    include Monad

    attr_reader :acc, :value

    def bind(&f)
      w = f.call @value
      raise "Non-writer value returned. (#{w.inspect})" unless w.is_a?(WriterClass)
      Writer(w.value, @acc << w.acc)
    end

    def self.return(value, acc)
      new(value, acc)
    end

    protected

    def initialize(value, acc)
      @acc = acc
      @value = value
    end
  end
end

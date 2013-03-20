require 'rb_monads/monad'

module RbMonads
  def Nothing(v=nil)
    Maybe::NothingClass
  end

  def Just(value)
    Maybe::JustClass.new(value)
  end

  class Maybe
    include Monad

    ## Maybe::Just
    class JustClass < Maybe
      attr_reader :value

      def bind(&f)
        maybe = f.call @value
        if maybe.is_a?(JustClass) || maybe == NothingClass
          maybe
        else
          raise("Non-maybe value returned. (#{maybe.inspect})")
        end
      end

      def inspect
        "#<Just #{value}>"
      end

      protected

      def initialize(value)
        @value = value
      end
    end
    ## End of Maybe::Just

    ## Maybe of Maybe::Nothing
    class NothingClass < Maybe
      def self.bind(&f)
        self
      end

      def self.return(value = nil)
        self
      end

      def self.inspect
        "#<Nothing>"
      end

      protected

      def initialize(value)
        raise "Should never be called"
      end
    end
    ## End of Maybe::Nothing

    def self.return(value)
      Just(value)
    end

    def self.lift(&b)
      Proc.new do |v|
        Maybe.return(b.call v)
      end
    end
  end
end

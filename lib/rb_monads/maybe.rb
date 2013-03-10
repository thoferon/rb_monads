require 'rb_monads/monad'

module RbMonads
  class Maybe

    ## Maybe::Just
    class Just < Maybe
      attr_reader :value

      def bind(&f)
        f.call @value
      end

      def self.return(value)
        new(value)
      end

      def nothing?
        false
      end

      protected

      def initialize(value)
        @value = value
      end
    end
    ## End of Maybe::Just

    ## Maybe of Maybe::Nothing
    class Nothing < Maybe
      def bind(&f)
        self
      end

      def self.return(value)
        new(value)
      end

      def nothing?
        true
      end

      protected

      def initialize(value)
      end
    end
    ## End of Maybe::Nothing

    def self.return(value)
      Just.new value
    end
  end
end

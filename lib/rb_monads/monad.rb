module RbMonads
  module Monad
    def bind(&f)
      raise NotImplementedError
    end

    def self.return(value)
      new(value)
    end
  end
end

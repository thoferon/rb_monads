module RbMonads
  class Monad
    def bind(&f)
      raise NotImplementedError
    end

    def self.return(value)
      new(value)
    end
  end
end

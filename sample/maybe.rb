require 'rb_monads/maybe'

include RbMonads

def f(i)
  Just(i)
    .bind {|v| Just(v+1)}
    .bind {|v| v > 3 ? Nothing() : Just(v)}
    .bind(&Maybe.lift {|v| v+1}) # lifting (+1)
end

puts f(0).inspect #=> #<Just 2>
puts f(3).inspect #=> #<Nothing>

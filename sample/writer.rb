require 'rb_monads/writer'

include RbMonads

res = Writer("ABCDEF", [])
  .bind {|v| Writer(v + "GHIJ", "Added: GHIJ")}
  .bind {|v| Writer(v + "ABDF", "Added: ABDF")}
  .bind {|v| Writer(v.gsub('A', 'a'), "A's changed to a's")}

puts "Value: #{res.value}"
puts "Acc  :", "======"
res.acc.each do |a|
  puts " -> #{a}"
end

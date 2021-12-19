def up_array(arr)
  arr.any?{|x| x < 0 || x > 9} || arr === [-0] ? nil : (arr.join.to_i + 1).to_s.split(//).map{|x| x.to_i}
end


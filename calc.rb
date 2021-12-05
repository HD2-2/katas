class Calculator
  def evaluate(string)
    arr = string.split.map{|x| x =~ /\d/ ? x.to_f : x }
    arr.count('/').times{
      i = arr.index('/')
      arr[i-1] /= arr[i+1]
      arr.delete_at(i)
      arr.delete_at(i)
    }
      arr.count('*').times{
      i = arr.index('*')
      arr[i-1] *= arr[i+1]
      arr.delete_at(i)
      arr.delete_at(i)
    }
      while arr.size > 1
      case arr[1]
      when '+'
          arr[0] += arr[2]
          arr.delete_at(1)
          arr.delete_at(1)
      when '-'
          arr[0] -= arr[2]
          arr.delete_at(1)
          arr.delete_at(1)
      end
    end
    return arr
  end
end

calc = Calculator.new
p calc.evaluate("2 + 3 * 4 / 3 - 6 / 3 * 3 + 8")
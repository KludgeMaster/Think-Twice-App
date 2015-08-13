def think_twice(expense_tt, expense_value, expense_interval)
  MIN_PERCENT = 5

  tt = expense_tt.to_f
  value = expense_value.to_f
  interval = expense_interval

  result = tt * 100 / value
  times = nil
  intervals = [365, 30, 14, 7, 1]

  if result >= MIN_PERCENT
    if result > 100
      times = (result / 100).round(2)
      result = 100
    end 
  else
    new_result = 0
    new_interval = nil
    intervals.each do |i|
      new_result = (tt * 100) / (value * (i.to_f / 365))
      new_interval = i
      break if new_result >= MIN_PERCENT
    end
    if new_result >= MIN_PERCENT
      result = new_result
      case new_interval
      when 365
        interval = 'annual'
      when 30
        interval = 'monthly'
      when 14
        interval = 'biweekly'
      when 7
        interval = 'weekly'
      when 1
        interval = 'daily' unless interval == 'once'
      else
        interval = nil
      end
    else
      result = ((tt * 100) / value * (1 / 365)).round(2)
      interval = 'daily' unless interval == 'once'
    end
  end
  if interval == 'once'
    interval = nil
  end
  return [result, interval, times]
end




# puts " #{result}% of your #{interval} #{name} budget"
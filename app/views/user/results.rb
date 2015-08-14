require 'pry'
MIN_PERCENT = 5

tt = 50.to_f
value = 10.to_f
interval = 'monthly'

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
      interval = 'annually'
    when 30
      interval = 'monthly'
    when 14
      interval = 'biweekly'
    when 7
      interval = 'weekly'
    when 1
      interval = 'daily' unless interval == 'once'
    else
      interval = 'once'
    end
  else
    result = ((tt * 100) / value * (1 / 365)).round(2)
    interval = 'daily' unless interval == 'once'
  end
end

puts [result, interval, times]
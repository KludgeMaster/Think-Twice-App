require 'pry'
# interval_hash = {
#   annually: 365,
#   monthly: 30,
#   biweekly: 14,
#   weekly: 7,
#   daily: 1,
#   once: 1
# }

# tt_value = 5.00
# expense_value = 1200.00
# interval = "annually"
# MINIMUM_VIABLE_PERCENT = 20


# result = (tt_value * 100) / expense_value

# if result < MINIMUM_VIABLE_PERCENT
#   interval_hash.values.each do |interv|
#     result = (tt_value * 100) / (expense_value * (interv.to_f / 365))
#     # interval = 
#     binding.pry
#     break if result > MINIMUM_VIABLE_PERCENT
#   end
# end
# puts result.round(2)

#method returns [result, interval, times]
MIN_PERCENT = 5

tt = 50.00
value = 10.00
interval = 'monthly'

result = tt*100/value
times = nil
intervals = [365, 30, 14, 7, 1]

if result >= MIN_PERCENT
  if result > 100
    times = (result/100).round(2)
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
    result = tt/value*(1/365).round(2)
    interval = 'daily' unless interval == 'once'
  end
end

puts [result, interval, times]
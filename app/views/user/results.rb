require 'pry'
interval_hash = {
  annually: 365,
  monthly: 30,
  biweekly: 14,
  weekly: 7,
  daily: 1,
  once: 1
}

tt_value = 5.00
expense_value = 1200.00
interval = "annually"
MINIMUM_VIABLE_PERCENT = 20


result = (tt_value * 100) / expense_value

if result < MINIMUM_VIABLE_PERCENT
  interval_hash.values.each do |interv|
    result = (tt_value * 100) / (expense_value * (interv.to_f / 365))
    # interval = 
    binding.pry
    break if result > MINIMUM_VIABLE_PERCENT
  end
end
puts result.round(2)
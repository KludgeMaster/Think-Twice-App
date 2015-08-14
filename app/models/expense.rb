class Expense < ActiveRecord::Base
  validates :name, presence: true
  validates :value, numericality: {only_integer: true, greater_than: 0}
  @@MIN_PERCENT = 5
  
  def think_twice(expense_tt)
    tt = expense_tt.to_f
    value = self.value.to_f
    interval = self.interval
    result = 0
    times = nil
    temp = {
      annual: 365,
      monthly: 30,
      biweekly: 14,
      weekly: 7,
      daily: 1,
      once: 1
    }
    daily_value = tt/(value/temp[interval.to_sym])
    values = {
      annual: (daily_value/365)*100,
      monthly: (daily_value/30)*100,
      biweekly: (daily_value/14)*100,
      weekly: (daily_value/7)*100,
      daily: (daily_value/1)*100,
      # once: (daily_value/1)*100
    }
    values.each do |interv, percentage|
      if percentage >= 40 && percentage <= 60
        result = percentage
        interval = interv
        break
      elsif percentage >= 25 && percentage < 40
        result = percentage
        interval = interv
      elsif percentage >= 200
        result = percentage
        interval = interv
      elsif percentage <25 && percentage > 10  
        result = percentage
        interval = interv
      else
        result = percentage
        interval = interv
      end
    end  
    if self.interval == 'once'
      interval = ""
      result = (tt * 100) / self.value.to_f
    end  
    return [result.round(1),interval,times]
  end
      
end
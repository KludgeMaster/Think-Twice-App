expenses_list = [
  [ 1, "Beer", 2, "Daily" ],
  [ 1, "Gym Membership", 175, "Monthly" ],
  [ 1, "VPN", 70, "Yearly" ],
  [ 1, "Groceries", 1231, "Weekly" ],
  [ 1, "4K Monitor", 436, "One time purchase"]
]

expenses_list.each { |user, name, value, interval|
  Expense.create(user_id: user, name: name, value: value, interval: interval)
}


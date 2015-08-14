# Create some sample users
User.destroy_all
User.create!(name: "Ryan", email: "yiryans@gmail.com", password: "123")
User.create!(name: "Alex", email: "Alex@gmail.com", password: "123")

Expense.destroy_all
Expense.create!(user_id: 0, name: "Groceries", value: 200, interval: "biweekly")
Expense.create!(user_id: 0, name: "Coffee", value: 25, interval: "weekly")
Expense.create!(user_id: 0, name: "Transportation", value: 6, interval: "daily")
Expense.create!(user_id: 0, name: "Car", value: 30000, interval: "once")


Expense.create!(user_id: 1, name: "Rent", value: 1500, interval: "monthly")
Expense.create!(user_id: 1, name: "Bus Pass", value: 125, interval: "monthly")
Expense.create!(user_id: 1, name: "Headphone", value: 350, interval: "once")
Expense.create!(user_id: 1, name: "Beer", value: 40, interval: "weekly")
Expense.create!(user_id: 1, name: "Phone Bill", value: 100, interval: "monthly")


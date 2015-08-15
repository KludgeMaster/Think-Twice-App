# Create some sample users
User.destroy_all
User.create!(name: "Ryan", email: "yiryans@gmail.com", password: "123")
User.create!(name: "Alex", email: "Alex@gmail.com", password: "123")
User.create!(name: "TTadmin", email: "ttadmin@gmail.com", password: "123", admin: true)

Expense.destroy_all
Expense.create!(user_id: 0, name: "Groceries", value: 200, interval: "biweekly", category: "Food")
Expense.create!(user_id: 0, name: "Coffee", value: 25, interval: "weekly", category:"Food")
Expense.create!(user_id: 0, name: "Transportation", value: 6, interval: "daily", category: "Transportation")
Expense.create!(user_id: 0, name: "Car", value: 30000, interval: "once", category:"Miscellaneous")


Expense.create!(user_id: User.find_by(name: "Ryan").id, name: "Rent", value: 1500, interval: "monthly", category: "Accommodation")
Expense.create!(user_id: User.find_by(name: "Ryan").id, name: "Bus Pass", value: 125, interval: "monthly",category:"Transportation")
Expense.create!(user_id: User.find_by(name: "Ryan").id, name: "Headphone", value: 350, interval: "once", category: "Miscellaneous")
Expense.create!(user_id: User.find_by(name: "Ryan").id, name: "Beer", value: 40, interval: "weekly", category: "Entertainment")
Expense.create!(user_id: User.find_by(name: "Ryan").id, name: "Phone Bill", value: 100, interval: "monthly", category: "Utilities")


Expense.create!(user_id: User.find_by(name: "TTadmin").id, name: "Rent", value: 1358, interval: "monthly", category: "Accommodation")
Expense.create!(user_id: User.find_by(name: "TTadmin").id, name: "Bus Pass", value: 108, interval: "monthly", category: "Transportation")
Expense.create!(user_id: User.find_by(name: "TTadmin").id, name: "Internet Bill", value: 54, interval: "monthly", category: "Utilities")
Expense.create!(user_id: User.find_by(name: "TTadmin").id, name: "Restaurant", value: 17, interval: "once", category: "Food")
Expense.create!(user_id: User.find_by(name: "TTadmin").id, name: "Phone Bill", value: 97, interval: "monthly", category:"Utilities")


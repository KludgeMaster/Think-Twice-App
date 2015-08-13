# Homepage (Root path)
get '/' do
  erb :index
end

get '/users/results/' do
  @expenses = Expense.all
  erb :'user/results'
end
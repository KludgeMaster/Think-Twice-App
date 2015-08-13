# Homepage (Root path)
get '/' do
  erb :home
end

get '/users/results/' do
  @expenses = Expense.all
  erb :'user/results'
end

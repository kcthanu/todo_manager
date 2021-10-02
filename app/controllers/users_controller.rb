class UsersController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    render plain: User.all.map{ |user| user.to_pleasant_string }.join("\n")
  end
  
  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = Todo.create!(name: name, email: email, password: password)
    
    response_text = "Your new user is created with the id #{new_user.id}"
    render plain: response_text
  end
  
  def login
    email = params[:email]
    password = params[:password]
    text = User.take("email = ? and password > ?", email, password) == nil ? false : true
    
    render plain: "#{text}"
  end

end
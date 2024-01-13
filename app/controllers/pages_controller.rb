class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def home
    puts "Hello Programmer:  in PagesController action is home"
  end
end

class ToDoListsController < ApplicationController

  def index

  end

  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(params.require(:to_do_list).permit(:title, :description))
    if @to_do_list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

end

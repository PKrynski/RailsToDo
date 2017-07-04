class ToDoListsController < ApplicationController

  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @all_lists = ToDoList.all
  end

  def show
    @items = @to_do_list.items.all
  end

  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    if @to_do_list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @to_do_list.update(to_do_list_params)
      redirect_to to_do_list_path(@to_do_list)
    else
      render 'edit'
    end
  end

  def destroy
    @to_do_list.destroy
    redirect_to root_path
  end

  private

  def to_do_list_params
    params.require(:to_do_list).permit(:title, :description)
  end

  def find_list
    @to_do_list = ToDoList.find(params[:id])
  end

end

class ToDoListsController < ApplicationController

  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @all_lists = ToDoList.where(:user_id => current_user.id)
    end
  end

  def show
    @items = @to_do_list.items.all
  end

  def new
    @to_do_list = current_user.to_do_lists.build
  end

  def create
    @to_do_list = current_user.to_do_lists.build(to_do_list_params)
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

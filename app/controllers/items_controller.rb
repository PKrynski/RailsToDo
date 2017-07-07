class ItemsController < ApplicationController

  before_action :find_list
  before_action :check_list_owner, only: [:new, :destroy]

  def index
    @all_items = @to_do_list.items.all
  end

  def new
    @item = @to_do_list.items.new
  end

  def create
    @item = @to_do_list.items.create(item_params)
    if @item.save
      ActionCable.server.broadcast "share", item: @item.content, item_id: @item.id, list_id: @to_do_list.id
      redirect_to to_do_list_path(@to_do_list)
    else
      render 'new'
    end
  end

  def destroy
    @item = @to_do_list.items.find(params[:id])
    @item.destroy
    ActionCable.server.broadcast "share", item_id: @item.id, list_id: @to_do_list.id
    redirect_to to_do_list_path(@to_do_list)
  end

  def complete
    @item = @to_do_list.items.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to to_do_list_path(@to_do_list)
  end

  private

  def find_list
    @to_do_list = ToDoList.find(params[:to_do_list_id])
  end

  def item_params
    params.require(:item).permit(:content)
  end

  def check_list_owner
    unless current_user == @to_do_list.user
      flash[:alert] = "You cannot add or remove items from list."
      redirect_to root_path
    end
  end

end

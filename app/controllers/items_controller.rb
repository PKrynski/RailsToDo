class ItemsController < ApplicationController

  before_action :find_list

  def index
    @all_items = @to_do_list.items.all
  end

  def new
    @item = @to_do_list.items.new
  end

  def create
    @item = @to_do_list.items.create(item_params)
    if @item.save
      redirect_to to_do_list_path(@to_do_list)
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def find_list
    @to_do_list = ToDoList.find(params[:to_do_list_id])
  end

  def item_params
    params.require(:item).permit(:content)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end

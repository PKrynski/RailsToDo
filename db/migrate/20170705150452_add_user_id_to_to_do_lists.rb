class AddUserIdToToDoLists < ActiveRecord::Migration[5.0]
  def change
    add_column :to_do_lists, :user_id, :integer
  end
end

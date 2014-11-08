class AddCellphoneToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cellphone, :integer
    add_column :users, :cellphone, :string
  end
end

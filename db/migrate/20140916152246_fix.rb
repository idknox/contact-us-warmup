class Fix < ActiveRecord::Migration
  def change
    remove_column :contacts, :name, :integer
    add_column :contacts, :name, :string
  end
end

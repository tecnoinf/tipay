class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name,           :string
    add_column :users, :last_name,      :string
    add_column :users, :date_of_birth,  :datetime
    add_column :users, :is_female,      :boolean, default: false
    add_column :users, :biography,      :text
    add_column :users, :contacto,       :text
    add_column :users, :role,           :integer, default: 2
  end
end

class AddNameToPages < ActiveRecord::Migration[7.2]
  def change
    add_column :pages, :name, :string
  end
end

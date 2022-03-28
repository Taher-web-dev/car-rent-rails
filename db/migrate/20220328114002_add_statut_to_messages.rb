class AddStatutToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :statut, :boolean
  end
end

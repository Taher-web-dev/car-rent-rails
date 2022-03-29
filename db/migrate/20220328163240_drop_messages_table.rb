# frozen_string_literal: true

class DropMessagesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :messages do |t|
      t.text :content
      t.boolean :statut
      t.timestamps
    end
  end
end

class AddKindToContact < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :Kind, foreign_key: true
  end
end

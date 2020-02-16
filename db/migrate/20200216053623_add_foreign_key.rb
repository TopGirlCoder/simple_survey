class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
  	add_reference :surveys, :surveyor, index: true, foreign_key: { to_table: :users }
  	add_reference :votes, :voter, index: true, foreign_key: { to_table: :users }
  end
end

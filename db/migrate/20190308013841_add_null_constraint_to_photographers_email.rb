class AddNullConstraintToPhotographersEmail < ActiveRecord::Migration[5.2]
  def up
    change_column_null :photographers, :email, false
  end

  def down
    change_column_null :photographers, :email, true
  end
end

class AddsMandatoryCommentsData < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:comments, :comment, false)
  end
end

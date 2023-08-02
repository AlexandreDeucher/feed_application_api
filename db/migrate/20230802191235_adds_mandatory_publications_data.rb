class AddsMandatoryPublicationsData < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:publications, :title, false)
    change_column_null(:publications, :description, false)
  end
end

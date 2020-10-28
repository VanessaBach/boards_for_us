class RenameTypeToStyle < ActiveRecord::Migration[6.0]
  def change
    rename_column :boards, :type, :style
  end
end

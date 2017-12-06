class AddPassrate2016ToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :passrate2016, :integer
  end
end

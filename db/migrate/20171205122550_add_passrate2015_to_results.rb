class AddPassrate2015ToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :passrate2015, :integer
  end
end

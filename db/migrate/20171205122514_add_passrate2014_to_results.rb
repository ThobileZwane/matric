class AddPassrate2014ToResults < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :passrate2014, :integer
  end
end

class AddTraceIdToTables < ActiveRecord::Migration
  def change
    add_column :transaction_sample_data, :trace_id, :string
    add_index :transaction_sample_data, :trace_id
  end
end

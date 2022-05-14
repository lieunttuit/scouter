class RemoveEvaluateeIdFromEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_column :evaluations, :evaluatee_id, :integer
  end
end

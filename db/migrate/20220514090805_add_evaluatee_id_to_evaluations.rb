class AddEvaluateeIdToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :evaluatee_id, :integer
  end
end

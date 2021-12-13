class ChangeDataComprehensiveEvaluationToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :comprehensive_evaluation, :float
  end
end

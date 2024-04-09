# This migration comes from spree_reviews (originally 20210728110707)
class ChangeUserIdAndReviewIdTypeForSpreeFeedbackReviews < ActiveRecord::Migration[4.2]
  def change
    change_table(:spree_feedback_reviews) do |t|
      t.change :user_id, :bigint
      t.change :review_id, :bigint
    end
  end
end

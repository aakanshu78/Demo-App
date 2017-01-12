class Survey < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order('created_at DESC') }

    validates :user_id, presence: true
    validates :question, presence: true
    validates :option_a, presence: true
    validates :option_b, presence: true
    validates :option_c, presence: true
    validates :option_d, presence: true

    def self.from_followed_users(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids})",
          user_id: user.id)
  end
end
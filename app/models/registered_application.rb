class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }

  validates :url, presence: true, length: { minimum: 8 }
  validates_format_of :url, :with => URI::regexp(%w(http https))

  # Always grab the newest registered apps first
  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) { user ? where(user: user) : [] }

end

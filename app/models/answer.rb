class Answer < ApplicationRecord
  belongs_to :question
  has_many :votes, as: :votable

  # Callback to set default upvotes to 0
  before_create :set_default_upvotes

  private

  def set_default_upvotes
    self.upvotes ||= 0
  end
end

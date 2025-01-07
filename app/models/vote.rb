class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true

  # Validate the vote_type to ensure it’s either upvote or downvote
  validates :vote_type, inclusion: { in: [true, false] }
end


class Question < ApplicationRecord
    has_many :answers
    has_many :votes, as: :votable
  
    # set default upvotes to 0
    before_create :set_default_upvotes
  #sets the default upvotes to 0 before creating a question.
    private
  
    def set_default_upvotes
      self.upvotes ||= 0
    end
  end
  
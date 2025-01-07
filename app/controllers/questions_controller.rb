class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :upvote]
  
    # POST /questions
    def create
      @question = Question.new(question_params)
  
      if @question.save
        render json: @question, status: :created
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
    # GET /questions
    def index
      @questions = Question.all
      @questions = @questions.map { |q| q.attributes.merge(upvotes: q.votes.where(vote_type: true).count) }
      render json: @questions
    end
  
    # POST /questions/:id/upvote
    def upvote
      @question.votes.create(vote_type: true, user: "user_#{rand(1..100)}") # Random user for simplicity
      render json: @question, status: :ok
    end
  
    private
  
    def set_question
      @question = Question.find(params[:id])
    end
  
    def question_params
      params.require(:question).permit(:title, :body)
    end
  end
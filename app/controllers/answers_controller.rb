class AnswersController < ApplicationController
    before_action :set_question, only: [:create, :index]
    before_action :set_answer, only: [:upvote]
  
    # POST /questions/:question_id/answers
    def create
      @answer = @question.answers.new(answer_params)
  
      if @answer.save
        render json: @answer, status: :created
      else
        render json: @answer.errors, status: :unprocessable_entity
      end
    end
  
    # GET /questions/:question_id/answers
    def index
      @answers = @question.answers
      @answers = @answers.map { |a| a.attributes.merge(upvotes: a.votes.where(vote_type: true).count) }
      render json: @answers
    end
  
    # POST /answers/:id/upvote
    def upvote
      @answer.votes.create(vote_type: true, user: "user_#{rand(1..100)}")
      render json: @answer, status: :ok
    end
  
    private
  
    def set_question
      @question = Question.find(params[:question_id])
    end
  
    def set_answer
      @answer = Answer.find(params[:id])
    end
  
    def answer_params
      params.require(:answer).permit(:body)
    end
  end
  
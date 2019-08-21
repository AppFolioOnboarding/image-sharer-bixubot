module Api
  class FeedbacksController < ApplicationController
    def create
      @fb = Feedback.new(name: params[:name], comment: params[:comments])

      if @fb.save
        render status: :ok, json: {}
      else
        render status: :unprocessable_entity, json: {}
      end
    end
  end
end

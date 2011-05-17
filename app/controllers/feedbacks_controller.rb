class FeedbacksController < ApplicationController
  respond_to :html

  def new

  end

  def create
    email = current_user.email if current_user
    email ||= params[:email]
    if params[:body].present?
      FeedbackMailer.feedback(email, params[:body]).deliver
      flash[:notice] = t('feedbacks.notice.create')
    end
    redirect_to root_path
  end
end

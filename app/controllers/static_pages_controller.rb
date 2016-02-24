class StaticPagesController < ApplicationController
  def index
  end

  def get_email
		#danger - did not whitelist
  	MailList.create email: params[:email]
  	# flash[:success] = "Welcome to the Sample App!"
  	redirect_to root_url, alert: "Signed up successfully!"
    WelcomeMailer.welcome(params[:email]).deliver_now
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:MailList).permit(:email)
    end
end

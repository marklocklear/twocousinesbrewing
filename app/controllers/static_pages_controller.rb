class StaticPagesController < ApplicationController
  def index
  	#danger - did not whitelist
  	MailList.create email: params[:email]
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:MailList).permit(:email)
    end
end

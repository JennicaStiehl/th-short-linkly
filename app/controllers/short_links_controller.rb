class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:show, :create]

  def show
    redirect_to @short_link.long_link, status: :moved_permanently
  end

  def create
    sl = ShortLink.new(short_link_params)
    if sl
      sl.save
      render json:
      { status: "201",
        # status_code: :created,
          body:
        {
            "long_link": sl.long_link,
            "short_link": @short_link
          }}
    else
          render json: { status: "401",
          body:
            {
              "message": "Unauthorized"
              }}
    end
  end

  private

  def set_short_link
    @short_link = ShortLink.find_by_user_id(params[:user_id])
    head :not_found unless @short_link
  end

  def short_link_params
    params.permit(:long_link, :user_id)
  end
end

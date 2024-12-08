class ChecksController < ApplicationController
  before_action :set_page

  def create
    @page.run_check!
    redirect_to @page
  end

  def set_page
    @page = Page.find(params[:page_id])
  end
end

module ErrorHandlers
  extend ActiveSupport::Concern

  include do
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  private

  def rescue500(e)
    render "errors/internal_server_error", status: :internal_server_error
  end

  def rescue403(e)
    @exception = e
    render "errors/forbidden", status: :forbidden
  end

  def rescue404(e)
    render "errors/not_found", status: :not_found
  end

end
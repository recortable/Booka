class Backend::Responder < ActionController::Responder
  include Responders::FlashResponder

  def initialize(*)
    super
    @flash_now = :on_failure
  end

end

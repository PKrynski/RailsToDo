class ShareChannel < ApplicationCable::Channel
  def subscribed
    stream_from "share"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

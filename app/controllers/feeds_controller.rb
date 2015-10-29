class FeedsController < ApplicationController

  layout false

  def rss
    @resources = Resource.limit(50)
  end
end

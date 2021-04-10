class ThreadsController < ApplicationController
  def index
    @threads = Thread.all.sort_by { |t| [t.created_at] }
  end
end

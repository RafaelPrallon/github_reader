class IssuesController < ApplicationController
  before_action :set_issue
  def index
    @issues = Issue.all
  end

  def show;  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end

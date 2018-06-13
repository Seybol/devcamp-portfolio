class PagesController < ApplicationController
  def homepage
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end

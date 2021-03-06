class PagesController < ApplicationController

  before_filter :set_positions, only: :team
  before_filter :admin_user!, only: [:settings]

  def index
  end

  def dashboard
  end

  def home
  end

  def join
    @application = Application.new
  end

  def about
  end

  def team
    @members = User.current_members
    # add a nil to indicate the placement for join link
    @members << nil
    @alumni = User.all - @members
  end

  def sponsors
    @gold_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Gold Sponsor"), 4, fill_out: true)
    @silver_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Silver Sponsor"), 6, fill_out: true)
    @partners = organize_in_rows(Sponsor.where(:sponsorship_type => "Partner"), 6, fill_out: true)
  end

  def projects
    @projects = Project.all.order('id')
  end

  def contact
    @message = Message.new
  end

  def error
  end

end

class PagesController < ApplicationController

  before_filter :set_positions, :about, :team

  def index
  end

  def home
  end

  def join
    @application = Application.new
  end

  def about
    members = []
    # find all members
    @positions.each do |position|
      roles = Member.find_all_by_position(position)
      members += roles if roles
    end
    # add a nil to indicate the placement for join link
    members << nil
    @team = organize_in_rows(members, 5)
  end

  def team
    members = []
    # find all members
    @positions.each do |position|
      roles = Member.find_all_by_position(position)
      members += roles if roles
    end
    # add a nil to indicate the placement for join link
    members << nil
    @team = organize_in_rows(members, 5)
  end

  def sponsors
    @gold_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Gold Sponsor"), 4, fill_out: true)
    @silver_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Silver Sponsor"), 6, fill_out: true)
    @partners = organize_in_rows(Sponsor.where(:sponsorship_type => "Partner"), 6, fill_out: true)
  end

  def projects
    @projects = Project.all
  end

  def contact
    @message = Message.new
  end

end
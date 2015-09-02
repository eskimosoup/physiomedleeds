module Admin
  class TeamMembersController < Manticore::ApplicationController
  
    edit_images_for TeamMember, [:image]
  
    def index
      @team_members = TeamMember.order(:position)
    end
    
    def new
      @team_member = TeamMember.new
    end
    
    def create
      @team_member = TeamMember.new(params[:team_member])
      if @team_member.save
        redirect_to admin_team_members_path, :notice => "Team member successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @team_member = TeamMember.find(params[:id])
    end
    
    def update
      @team_member = TeamMember.find(params[:id])
      if @team_member.update_attributes(params[:team_member])
        redirect_to admin_team_members_path, :notice => "Team member successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @team_member = TeamMember.find(params[:id])
      @team_member.destroy
      redirect_to admin_team_members_path, :notice => "Team member destroyed."
    end
    
  end
end

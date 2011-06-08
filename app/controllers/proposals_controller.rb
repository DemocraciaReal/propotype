class ProposalsController < ApplicationController
  
  def index
    
  end
  
  def new
    @proposal = Proposal.new    
  end                       
  
  def create              
    proposal = Proposal.new(params[:proposal])
    
    if proposal.save
      flash[:notice] = "New Proposal created"
    end    
    redirect_to :action =>'index'    
  end  
end

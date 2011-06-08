require 'spec_helper'

describe ProposalsController do     
  describe "Proposal#create" do
    let(:proposal){ mock_model(Proposal).as_null_object }                                                     
    
    before do
      Proposal.stub(:new).and_return(proposal)
    end
    
    it 'creates a new proposal' do
      Proposal.should_receive(:new).with('title'=>'Lorem', 'description'=>'Lorem ipsum.').and_return(proposal)                                                                
      post :create, :proposal => {'title'=>'Lorem', 'description'=>'Lorem ipsum.'}
    end
    
    it 'save the proposal' do      
      proposal.should_receive(:save) 
      post :create
    end
                              
    context "when the proposal saves successfully" do      
      
      it "sets a flash[:notice] proposal" do
        post :create 
        flash[:notice].should eq("New Proposal created")
      end           
      
      it "redirects to the Proposals index" do 
        post :create 
        response.should redirect_to(:action => "index")
      end       
    end   
     
  end
end

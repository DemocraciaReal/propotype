require File.expand_path(File.dirname(__FILE__) + '/..' + '/acceptance_helper')

feature "Voting proposals" do
  before(:each) do
    #@user = User.make!       
    #register_and_log_in(@user.name, @user.password)
    @proposal = Proposal.make!
    visit('/')
    click_link('proposals')
  end 
  
  context "for which he didn't cast a vote before" do
    context "when he tries to vote it up" do
      before(:each) { page.click_link('vote up') }   
      
      it "should see the vote count increase by 1" do            
        pending()
        within('#votes') do
          page.should have_content('1')
        end
      end
    end      
                                                    
    context "when he tries to vote it down" do
      before(:each) { page.click_link('vote down')}  
      
      it "should see the vote decrease by 1" do
        pending()
        within('#votes') do
          page.should have_content('-1')
        end
      end            
    end
  end       
  
  context "for which he voted up" do
    before(:each) { page.click_link('vote up') }
    
    context "when he tries to vote it up" do
      before(:each) { click_link('vote up') }
                        
      it('should show a failure message') { pending(); page.should have_content('You can not vote twice for the same proposal') }      
      it('should not increase the votes count') { pending(); page.should have_content('1') }
    end               
                      
    context "when he tries to vote it down" do                      
      before(:each) { click_link('vote down') }
      
      it('should decrease the vote count by 1') { pending(); page.should have_content('0') }      
    end
  end
  
  context "for which he voted down" do
    before(:each) { page.click_link('vote down') }    
    
    context "when he tries to vote it up" do      
      before(:each) { page.click_link('vote up') }
      it('should increase the votes by one'){ pending(); page.should have_content('0') }
    end                                                                         
    
    context "when he tries to vote it down" do
      before(:each) { page.click_link('vote up') }
      it('should show a failure message') { pending(); page.should have_content('You can not vote twice for the same proposal') }            
      it('should not decrease the vote count') { pending(); page.should have_content('-1')}
    end
  end        
end
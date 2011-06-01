require File.expand_path(File.dirname(__FILE__) + '/..' + '/acceptance_helper')

feature "Creating a new Proposal" do          
  before(:each) do     
    #@user = User.make!       
    #register_and_log_in(@user.name, @user.password)
    visit('/')
    click_link('new proposal')
  end                  
  
  context "it should not be created" do
    it "if it has no title" do                 
      pending()
      fill_in_form_for_proposal(Proposal.make(:title=>''))
      page.should have_content('You need to write a title')
    end                                                   

    it "if it has no description" do
      pending()
      fill_in_form_for_proposal(Proposal.make(:description=>''))
      page.should have_content('You need to write a description')          
    end
  end  
        
  context "it should be created and" do
    before(:each) do
      @proposal = fill_in_form_for_new_proposal(Proposal.make())
    end                                            

    it "should have 0 votes" do
      pending()
      within('#votes') do
        page.should have_content('0')
      end                          
    end                            

    it "should have description" do
      pending()
      page.should have_content(@proposal.description)
    end                                             

    it "should have title" do
      pending()
      page.should have_content(@proposal.title)
    end
    it "should be listed in the proposals list" do
      pending()
      visit('/proposals')
      page.should have_content(@proposal.title)
    end          
  end                
end
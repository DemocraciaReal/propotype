module HelperMethods
  # Put helper methods you need to be available in all tests here.          
  
  def register_user(username, password)
  end                                    
  
  def log_user_in(username, password)    
  end                                
  
  def register_and_log_in(username, password)
    register_user(username, password)
    log_user_in(username, password)
  end
  
  def fill_in_form_for_new_proposal(proposal)
    fill_in('Title', :with=>proposal.title)
    fill_in('Description', :with=>proposal.description)
    click_button('Create Proposal')
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance  



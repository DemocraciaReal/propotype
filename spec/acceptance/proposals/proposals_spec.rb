require File.expand_path(File.dirname(__FILE__) + '/..' + '/acceptance_helper') 

require File.expand_path(File.dirname(__FILE__) + '/create_proposal')
require File.expand_path(File.dirname(__FILE__) + '/interact_with_existing_one') 
 
feature "Proposals" do
  context "A registered user" do                        
    before(:each) do
      #defined in support/helpers
      @user = register_user('username', 'userpassword')
    end                                       
    context "which is also loged in" do
      before(:each) do
        #defined in support/helpers
        @user = log_user_in(@user.name, @user.password)
      end           
      
      describe "when he tries to create a proposal" do
        include_context 'when he tries to create a proposal'
      end
      
      describe "when he interacts with an existing proposal" do
        include_context 'when he interacts with an existing proposal'
      end      
    end
  end
end
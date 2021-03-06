require 'spec_helper'

describe "UserPages" do
	
	subject { page }
	describe "sign up page" do 
		before { visit signup_path }

		it { should have_content('Sign up')}
		it { should have_title(full_title('Sign up'))}
	end

	describe "sign up " do 
		before { visit signup_path }
		let(:submit) { "create my account "}
		describe "with invalid information"
		it "should not create a user" do 
			expect {click_button submit}.not_to change(User, :count )

		end
	end

	describe "with valid infromation"
	 before do 
	 	fill_in "Name",                   with: "Example User"
	 	fill_in "Email",                  with: "user@example.com"
	 	fill_in "Password",               with: "foobar"
	 	fill_in "Password_confirmation",  with: "foobar"
	 end

	  it "should creat a user" do 
	  	expect { click_button submit}. to change(User, :count).by(1)
	  end
	  end





	describe "User pages" do 
		subject { page }
		describe "profile page" do 
			let(:user) { FactoryGirl.create(:user)}
			before { visit user_path(user)}

			it { should have_content(user.name)}
			it { should have_title(user.name)}
		end
	end
end


end

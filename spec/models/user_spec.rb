require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "is valid with name, email, password, password_confirmation" do
      
      @user = User.create(name: "Scott Morton", email: "d@gmail.com", password: "password", 
        password_confirmation: "password"
        ) 
      expect(@user).to be_valid
    end
     
    it "is not valid with out a name" do
      @user = User.create(name: nil, email: "davidsmorton@gmail.com", password: "password", 
      password_confirmation: "password"
      )  
      expect(@user).to_not be_valid
    end

    it "is not valid with out an email" do
      @user = User.create(name: "Scott Morton", email: nil, password: "password", 
      password_confirmation: "password"
      )  
      expect(@user).to_not be_valid
    end
    
    it "is not valid with out a password" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: nil, 
      password_confirmation: "password"
      )  
      expect(@user).to_not be_valid
    end

    it "is not valid with out a password_confirmation" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
      password_confirmation: nil
      )  
      expect(@user).to_not be_valid
    end

    it "is not valid with out a password and password_confirmation matching" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
      password_confirmation: "Password"
      )  
      expect(@user).to_not be_valid
    end

    it "is not valid with the same email with different cases in the data" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
      password_confirmation: "password"
      )  

      @user1 = User.create(name: "Paul Chen", email: "davIdsmorton@gMail.com", password: "password1", 
        password_confirmation: "password1"
        ) 
      expect(@user).to be_valid  
      expect(@user1).to_not be_valid
    end

    it "is not valid with the same email with different casesin the data" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
        password_confirmation: "password"
        )  

      @user1 = User.create(name: "Paul Chen", email: "davidsmorton@gmail.com", password: "password1", 
        password_confirmation: "password1"
        ) 
      expect(@user).to be_valid  
      expect(@user1).to_not be_valid
    end
 
    it "is not valid with password less than 4 characters" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "pas", 
        password_confirmation: "pas"
        )  
        expect(@user).to_not be_valid
     
    end 
  end

  
  describe '.authenticate_with_credentials' do
    it "is valid with a valid email and password" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
      password_confirmation: "password"
      )
    
      @user1 = User.authenticate_with_credentials("davidsmorton@gmail.com", "password")
      expect(@user1).to be_truthy
    end 

    it "is not valid without a password" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
        password_confirmation: "password"
        )
      
        @user1 = User.authenticate_with_credentials("davidsmorton@gmail.com", nil)
        expect(@user1).to be_falsey
    end

    it "is not valid without an email" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
        password_confirmation: "password"
        )
      
        @user1 = User.authenticate_with_credentials(nil, "password")
        expect(@user1).to be_falsey
    end

    it "is not valid with wrong email and correct password" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
        password_confirmation: "password"
        )
      
        @user1 = User.authenticate_with_credentials("e.morton@gmail.com", "password")
        expect(@user1).to be_falsey
    end

    it "is not valid with correct email and wrong password" do
      @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
        password_confirmation: "password"
        )
      
        @user1 = User.authenticate_with_credentials("davidsmorton@gmail.com", "Angel")
        expect(@user1).to be_falsey
    end

    it "is valid with spaces before and after email" do     
    @user = User.create(name: "Scott Morton", email: "davidsmorton@gmail.com", password: "password", 
      password_confirmation: "password"
      )
    
      result = User.authenticate_with_credentials(" davidsmorton@gmail.com ", "password")
      expect(result).to be_truthy
    end
  end

end

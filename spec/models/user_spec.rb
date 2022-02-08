RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
   
  
    it "user name should contain a password" do
      @user = User.new(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: nil, password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
      puts @user.errors.full_messages
    end

    it "user name should contain a password confirmation" do
      @user = User.new(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "password", password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "user name should contain a password and matching confirmation" do
      @user = User.new(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "password", password_confirmation: "wrongpassword")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "user should contain a unique email address" do
      @useremail1 = User.create(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "password", password_confirmation: "password")
      
      @useremail2 = User.create(first_name: "botan", last_name: "Amal", email: "A@gmail.com", password: "password", password_confirmation: "password")

       expect(@useremail2).to_not be_valid
       expect(@useremail2.errors.full_messages).to include("Email has already been taken")

    end

    it "user should contain a unique email address" do
      @useremail1 = User.create(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "password", password_confirmation: "password")
      
      @useremail2 = User.create(first_name: "Amal", last_name: "Botan", email: "a@gmail.com", password: "password", password_confirmation: "password")

       expect(@useremail2).to_not be_valid
       expect(@useremail2.errors.full_messages).to include("Email has already been taken")

    end


    it "user password must be above 6 characters" do
      @user = User.new(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "bye", password_confirmation: "bye")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe 'authenticate_with_credentials' do
    # examples for this class method here
    it "user must be authenticated with credentials" do
      @user = User.create(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "password", password_confirmation: "password")
      @user1 = User.authenticate_with_credentials("A@gmail.com", "password")
      expect(@user).to eq(@user1)
    end

    it "user must be authenticated with credentials even if they add white spaces" do
      @user = User.create(first_name: "Amal", last_name: "Botan", email: "A@gmail.com", password: "password", password_confirmation: "password")
      @user1 = User.authenticate_with_credentials(" A@gmail.com ", "password")
      expect(@user).to eq(@user1)
    end
  end

end
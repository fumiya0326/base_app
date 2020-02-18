require 'rails_helper'

RSpec.describe SulesController, type: :controller do
    
    
    describe "#teamindex" do
        it "responds successfully" do 
            get :teamindex
            expect(response).to be_success
        end
    end
    
    describe "#show" do
        before do
            @user=create(:user)
            @sule=create(:sule)
        end
        
        it "respond successfully"do
            sign_in @user
            get :show, params:{ id: @sule.id }
            expect(response).to be_success
        end
        
        it "respond successfully unless login"do
            get :show, params:{ id: @sule.id}
            expect(response).to be_success
        end
    end
    
    describe "#create" do
        context "as an authorized user"do
            before do
                @user=create(:user)
            end

            it "add a thread"do
                thread_params=attributes_for(:sule)
                sign_in @user
                expect{
                    post :create, params:{sule: thread_params}
                }.to change(Sule, :count).by(1)
            end
        end
        
        context "as a guest"do
            it "does not add a thread"do
                thread_params=attributes_for(:sule)
                post :create, params:{sule: thread_params}
                expect(response).to have_http_status"302"
            end
        end
                
    
    end

end

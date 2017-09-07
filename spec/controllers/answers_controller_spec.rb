require 'rails_helper'

RSpec.describe Api::V1::AnswersController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Answer. As you add validations to Answer, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # AnswersController. Be sure to keep this updated too.
  # let(:valid_session) { {} }
  #
  # describe "GET #index" do
  #   it "returns a success response" do
  #     answer = Answer.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns a success response" do
  #     answer = Answer.create! valid_attributes
  #     get :show, params: {id: answer.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Answer" do
  #       expect {
  #         post :create, params: {answer: valid_attributes}, session: valid_session
  #       }.to change(Answer, :count).by(1)
  #     end
  #
  #     it "renders a JSON response with the new answer" do
  #
  #       post :create, params: {answer: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json')
  #       expect(response.location).to eq(answer_url(Answer.last))
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "renders a JSON response with errors for the new answer" do
  #
  #       post :create, params: {answer: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested answer" do
  #       answer = Answer.create! valid_attributes
  #       put :update, params: {id: answer.to_param, answer: new_attributes}, session: valid_session
  #       answer.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "renders a JSON response with the answer" do
  #       answer = Answer.create! valid_attributes
  #
  #       put :update, params: {id: answer.to_param, answer: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "renders a JSON response with errors for the answer" do
  #       answer = Answer.create! valid_attributes
  #
  #       put :update, params: {id: answer.to_param, answer: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested answer" do
  #     answer = Answer.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: answer.to_param}, session: valid_session
  #     }.to change(Answer, :count).by(-1)
  #   end
  # end

end

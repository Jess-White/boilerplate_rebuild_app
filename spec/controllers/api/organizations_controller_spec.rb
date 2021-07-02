require 'rails_helper'

describe Api::OrganizationsController do
  let(:user) { User.create(email: 'test@test.test', password: 'testtest') }
  let(:user_jwt) {
    jwt = JWT.encode(
      { user_id: user.id },
      Rails.application.credentials.fetch(:secret_key_base),
      "HS256"
    )
  }

  def set_authorization_header
    request.headers["Authorization"] = "Bearer #{user_jwt}"
  end

  describe 'POST create' do
    it 'renders 201 with created organization' do
      set_authorization_header
      post :create, :params => { :name => "Test Organization" }

      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)).to include({
        "name" => "Test Organization",
      })
    end

    it 'creates new organization' do
      set_authorization_header
      expect {
        post :create, :params => { :name => "Test Organization" }
      }.to change(Organization, :count)
      expect(Organization.last().name).to eq "Test Organization"
    end

    it 'creates new organization_user' do
      set_authorization_header
      expect {
        post :create, :params => { :name => "Test Organization" }
      }.to change(OrganizationUser, :count)
    end

    it 'renders 401 if unauthenticated' do
      post :create, :params => { :name => "Test Organization" }
      expect(response).to have_http_status(401)
    end

    it 'renders 422 if missing name param' do
      set_authorization_header
      post :create
      expect(response).to have_http_status(422)
    end
  end
end
require 'rails_helper'
require_relative '../support/images_sample'


RSpec.describe ImageController, type: :controller do 
  context 'api already have 10 images stored' do
    before(:each) do
      create_list(:image, 10)
    end
    
    context 'do a GET /images/:id to an existant image' do
      let!(:response) do
        response = get :show, params: { id: 1}
        JSON.parse(response.body)
      end

      it('returns data') do
        expect(response.nil?).to be false
      end

      it('returns owner of image') do
        expect(response['owner'].nil?).to be false
      end

      it('returns description of image') do
        expect(response['description'].nil?).to be false
      end

      it('returns url of image') do
        expect(response['url'].nil?).to be false
      end

      it('returns image metadata') do
        expect(response['metadata'].nil?).to be false
      end

      it('returns image creation date') do
        expect(response['created_at'].nil?).to be false
      end
    end

    context 'do a GET /images/:id to an unexistent id' do
      let!(:response) { get :show, params: { id: -1 }}

      it('returns status code 404') do
        expect(response.status).to be 404
      end

      it('returns no data') do
        expect(response.body.length).to be 0
      end

      it('returns content/type header equals to text/plain') do
        expect(response.content_type).to eq 'text/plain'
      end
    end

    context 'do a GET /images' do
      let!(:response) { get :all }
      let(:body) { JSON.parse(response.body) }

      it 'returns status 200' do
        expect(response.status).to be 200
      end

      it 'returns an array with 10 elements' do
        expect(body.length).to be 10 
      end

      it 'returns data as json' do 
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end

  context 'api without image stored' do
    context 'do a GET /images' do
      let!(:response) { get :all }
      let(:body) { JSON.parse(response.body) }

      it 'returns an empty array' do
        expect(body.empty?).to be true
      end

      it 'returns status 204' do
        expect(response.status).to be 204
      end
    end
  end

  context 'do a POST /images' do
    let!(:file) { Rack::Test::UploadedFile.new(get_sample_file()) }   
    
    context 'with description' do
      let(:form_data) {{description: 'foo', file: file}}
      context 'with owner' do
        let!(:response) do 
          form_data[:owner] = 'bar'
          response = post :save, params: form_data
        end

        let(:status) { response.status }
        let(:body) { JSON.parse(response.body) }

        it('returns status code 201') do
          expect(status).to be 201
        end

        it('should return recently uploaded image') do
          expect(body['description']).to eq 'foo'
        end
      end

      context 'without owner' do
        let!(:response) do
          post :save, params: form_data
        end

        it('returns status code 422') do
          expect(response.status).to be 422
        end

        it('does not list recently uploaded image') do
          response = get :all
          expect(JSON.parse(response.body).empty?).to be true
        end
      end
    end
    
    context 'without description' do
      let!(:response) do
        post :save, params: { file: file, owner: 'foo' }
      end

      it('returns status code 422') do
        expect(response.status).to be 422
      end
    end

    context 'without file' do
      let!(:response) do
        post :save, params: { description: 'foo', owner: 'bar' } 
      end

      it('returns status code 422') do
        expect(response.status).to be 422
      end
    end
  end
end

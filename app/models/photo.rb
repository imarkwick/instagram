class Photo < ActiveRecord::Base

	has_attached_file :picture, 
	:styles => { 
		:medium => "300x300#", 
		:thumb => "100x100#" }, 
	storage: :s3,
	s3_credentials: {
		bucket: 'izinstagram',
		access_key_id: Rails.application.secrets.s3_access_key,
		secret_access_key: Rails.application.secrets.s3_secret_key
	}

	validates_attachment :picture, 
	:content_type => { :content_type => /\Aimage\/.*\Z/ }
end

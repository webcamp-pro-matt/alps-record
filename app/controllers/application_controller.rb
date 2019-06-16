class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


    #デバイスでeメール　パスワード以外を許可する
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:phone_number,users_children_attributes:[:post_code, :name_kanji_sei, :name_kanji_mei, :name_kana_sei, :name_kana_mei, :address] ])
	end
end

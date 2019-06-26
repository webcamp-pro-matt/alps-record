class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def admin_flag_check?
		if current_user == nil
			redirect_to "/"
		else
			if current_user.admin_flag == 1

			else
				redirect_to "/"
			end
		end
	end

	# 退会状態のユーザーについて、アクセス制限をかける
	def resignation_flag_check?
		# ログインしているかで処理を分ける
		if current_user == nil
			# 処理しません
		else
			# 退会状態でアクセスされた場合、トップページにリダイレクトする。
			if current_user.resignation_flag == 1
				redirect_to "/"
			# 退会していない状態では、何もしません。
			else
				#処理しません
			end

		end
	end


    #デバイスでeメール　パスワード以外を許可する
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:phone_number,users_children_attributes:[:post_code, :name_kanji_sei, :name_kanji_mei, :name_kana_sei, :name_kana_mei, :address] ])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end

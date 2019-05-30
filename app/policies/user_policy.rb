class UserPolicy < ApplicationPolicy
	# our authorization rules will go here
	def delete?
    isUserAdminAndRecord
	end

	def update?
		isUserAdminAndRecord
	end

	def show?
		isUserAdminAndRecord
	end

	def list?
	  user.role == "admin"
	end

	private

	def isUserAdminAndRecord
    user.role == 'admin' || record == user
	end
	
end
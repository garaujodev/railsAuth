class UserPolicy < ApplicationPolicy
	# our authorization rules will go here
	def delete?
    user.role == "admin" || record == user
	end

	def update?
		user.role == "admin" || record == user
	end

	def show?
		user.role == "admin" || record == user
	end

	def list?
	  user.role == "admin"
	end

end
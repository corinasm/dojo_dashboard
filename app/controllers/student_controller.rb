class StudentController < ApplicationController
	def index
	end

	def new
		@selected_dojo = Dojo.find(params[:dojo_id]) # id passed through url
		@dojos = Dojo.all  # for the selection input in the form
	end  

	def create
		@selected_dojo = Dojo.find(params[:dojo_id])
		student = Student.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:dojo_id])
		redirect_to '/dojos/'+ params[:dojo_id]
	end

	def show
		@student_dojo = Dojo.find(params[:dojo_id]) #dojo_id passed through URL
		@selected_student = Student.find(params[:id]) #student id passed through URL
	end

	def edit
		@student_dojo = Dojo.find(params[:dojo_id]) #dojo_id passed through URL
		@student = Student.find(params[:id])
		@dojos = Dojo.all
	end

	def update
		Student.find(params[:id]).update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:dojo_id])
		redirect_to '/dojos/'+params[:dojo_id]
	
	end

	def destroy
		Student.find(params[:id]).destroy
		redirect_to '/dojos/'+params[:dojo_id]
	end
end

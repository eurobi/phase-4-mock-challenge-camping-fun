class SignupsController < ApplicationController
    def index
        signups = Signup.all
        render json: signups
    end
    def create
        signup = Signup.create({
            camper_id: params[:camper_id],
            activity_id: params[:activity_id],
            time: params[:time]
        })
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
        end
    end
end

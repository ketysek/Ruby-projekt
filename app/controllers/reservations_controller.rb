class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @menu = Menu.find(params[:menu_id])
  end

  def create
    customer = Customer.where(email: params[:reservation][:email]).first
    if customer.nil?
      puts "no-customer....creating!"
      customer = Customer.new({
        name: params[:reservation][:name],
        surname: params[:reservation][:surname],
        email: params[:reservation][:email]
        })
      customer.save!
    end

    @reservation = Reservation.new({
      menu_id: params[:menu_id],
      customer_id: customer.id,
      count: params[:reservation][:count]
      })
    @reservation.save!
    redirect_to root_path
  end
end

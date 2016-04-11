class WelcomeController < ApplicationController
  layout "welcome"
  def index
    @posts= Post.all.order('created_at DESC').limit(6)
  end


  def mailist_signup
    gb = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    gb.lists(ENV['MAILCHIMP_LIST_ID']).members.create(
         body: {
           email_address: params[:email][:email],
           status: "pending"
           }
         )

        @message = 'Thanks for signing up!'

      rescue StandardError => e
        @error = true

        if e.message =~ /is already subscribed to the list/
          @message = "You're already signed up to receive updates. Thanks for your enthusiasm!"
        else
          @message = "Oops! Looks like we ran into an error.Please try again later!"
        end


  end


  private

    def gem_available?(name)
       Gem::Specification.find_by_name(name)
    rescue Gem::LoadError
       false
    rescue
       Gem.available?(name)
    end
end

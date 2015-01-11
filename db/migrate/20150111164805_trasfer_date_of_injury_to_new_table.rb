class TrasferDateOfInjuryToNewTable < ActiveRecord::Migration
  def change
  	Claim.all.each do |claim|
  		injury = claim.date_of_injury
  		claim.injuries.create(date: injury) if injury
  		claim.date_of_injury = nil
  		claim.save!
  	end
  end
end

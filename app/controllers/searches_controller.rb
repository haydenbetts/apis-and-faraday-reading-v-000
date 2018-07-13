class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'Q4HUVTXTUFHGVGCHLHDRQVZWLUSPCGYBDR3GLAMJJCCEHYJC'
      req.params['client_secret'] = '421Y1NTWTBWSTXWJXN1GVSZXQO0JOXJ34XH1THBQLKW3IQFQ'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end

    body_hash = JSON.parse(@resp.body)
    @venus = body_hash["response"]["venus"]
    render 'search'
  end
end

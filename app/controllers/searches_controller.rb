class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @req = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = B1OAQP0SGDGIIBXKW5GCMXDBC5RAT0Y1MHCDQC3IYNYLIOLF
      req.params['client_secret'] = T0R02AMCP1JN41HGSZ2QZ4VAH2VJ0FIUZSU5YYZIAF5KY0RC
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end

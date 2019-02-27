class TbmApi
  class << self
    def realtime stop_id, line_code
      get_json "https://ws.infotbm.com/ws/1.0/get-realtime-pass/#{stop_id}/#{line_code}"
    end

    def lines
      get_json "https://ws.infotbm.com/ws/1.0/network/get-lines-informations"
    end

    def line tbm_line_id
      get_json "https://ws.infotbm.com/ws/1.0/network/line-informations/#{tbm_line_id}"
    end

    private

    def get_json url
      JSON.parse(HTTP.get(url).body.to_s)
    end
  end
end

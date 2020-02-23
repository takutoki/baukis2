# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ルーティング' do
  config = Rails.application.config.baukis2
  context '職員トップページパス(baukis2.example.com)にGETリクエスト' do
    url = "http://#{config[:staff][:host]}/#{config[:staff][:path]}"
    it 'OK' do
      expect(get: url).to route_to(
        host: config[:staff][:host],
        controller: 'staff/top',
        action: 'index'
      )
    end
  end

  context '管理者ログインフォーム(baukis2.example.com)にGETリクエスト' do
    url = "http://#{config[:admin][:host]}/#{config[:admin][:path]}/login"
    it 'OK' do
      expect(get: url).to route_to(
        host: config[:admin][:host],
        controller: 'admin/sessions',
        action: 'new'
      )
    end
  end

  context 'ホスト名をbaukis2.example.com以外にしてリクエスト' do
    it 'ルーティング対象外' do
      expect(get: 'http://foo.example.jp').not_to be_routable
    end
  end

  context 'baukis2.example.com上の存在しないパスにリクエスト' do
    it 'ルーティング対象外' do
      expect(get: "http://#{config[:staff][:host]}/xyz").not_to be_routable
    end
  end
end
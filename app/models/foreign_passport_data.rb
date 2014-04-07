#coding: utf-8
class ForeignPassportData < ActiveRecord::Base
  belongs_to :client
end

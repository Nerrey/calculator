class StaticsController < ApplicationController
  before_action :set_lists, only: [:calculator]
  after_action :allow_iframe, only: :calculator

  # base        4118 
  # territory   Коэфициент территории
  # drivers     Количество лиц допущенных к управлению
  # experience  Коэф возраста и стажа
  # period      Период страхования
  # power       Коэф.мощности
  # kbm         КБМ
  
  def calculator
    if check_params
      @result = get_koeff.round(0)
    end
  end

  private 

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def get_koeff
    4118 *
    params[:drivers].to_f *
    params[:experience].to_f *
    params[:period].to_f *
    params[:power].to_f *
    params[:kbm].to_f
  end

  def check_params
    params[:drivers] &&
    params[:experience] &&
    params[:period] &&
    params[:power] &&
    params[:kbm]
  end

  def set_lists
    @territory_opts =  [[1, 1], [2, 2]]
    @drivers_opts =    [["ограниченное", 1], ["неограниченное", 1.8]]
    @experience_opts = [["до 22 лет, стаж до 3 лет", 1.8],
                        ["старше 22 лет, стаж до 3 лет", 1.7],
                        ["до 22 лет, стаж больше 3 лет", 1.6],
                        ["старше 22 лет, стаж больше 3 лет", 1]]
    @period_opts =     [["3 мес", 0.5],
                        ["4 мес", 0.6],
                        ["5 мес", 0.65],
                        ["6 мес", 0.7],
                        ["7 мес", 0.8],
                        ["8 мес", 0.9],
                        ["9 мес", 0.95],
                        ["10 мес", 1],
                        ["11 мес", 1],
                        ["12 мес", 1]]
    @power_opts =      [["до 50", 0.6],
                        ["от 51 до 70", 1],
                        ["от 71 до 100", 1.1],
                        ["от 101 до 120", 1.2],
                        ["от 121 до 150", 1.4],
                        ["от 151 и выше", 1.6]]
    @kbm_opts =        [["0", 2.30],
                        ["1", 1.55],
                        ["2", 1.40],
                        ["3", 1.00],
                        ["4", 0.95],
                        ["5", 0.90],
                        ["6", 0.85],
                        ["7", 0.80],
                        ["8", 0.75],
                        ["9", 0.70],
                        ["10", 0.65],
                        ["11", 0.60],
                        ["12", 0.55],
                        ["13", 0.50]]
  end

end

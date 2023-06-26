class WorkingTimesController < ApplicationController
  before_action :set_working_time, only: [:show, :edit, :update, :destroy]

  # GET /working_times
  # GET /working_times.json
  def index
    @working_times = WorkingTime.all
  end

  # GET /working_times/1
  # GET /working_times/1.json
  def show
  end

  # GET /working_times/new
  def new
    @working_time = WorkingTime.new
  end

  # GET /working_times/1/edit
  def edit
  end

  # POST /working_times
  # POST /working_times.json
  def create
    @working_time = WorkingTime.new(working_time_params)

    respond_to do |format|
      if @working_time.save
        format.html { redirect_to @working_time, notice: 'Working time was successfully created.' }
        format.json { render :show, status: :created, location: @working_time }
      else
        format.html { render :new }
        format.json { render json: @working_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_times/1
  # PATCH/PUT /working_times/1.json
  def update
    respond_to do |format|
      if @working_time.update(working_time_params)
        format.html { redirect_to @working_time, notice: 'Working time was successfully updated.' }
        format.json { render :show, status: :ok, location: @working_time }
      else
        format.html { render :edit }
        format.json { render json: @working_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_times/1
  # DELETE /working_times/1.json
  def destroy
    #@working_time.destroy
    check = @working_time.destroy
    
    respond_to do |format|
      if check
        format.html { redirect_to working_times_url, notice: 'Working time was successfully destroyed.' }
      else
        format.html { redirect_to working_times_url, notice: '勤務時間マスターは削除できません' }
      end
      format.json { head :no_content }
    end
  end
  
  #ajax
  #勤務時間の計算(作業日報側からajax呼び出し)
  #def calc_work_time
  #  勤務時間マスターよりデータ取得
  #  working_time = WorkingTime.first
  #  開始時間の取得
  #  @start_time = params[:start_time].to_i
  #  終了時間の取得
  #  @end_time = params[:end_time].to_i
  #  休憩時間１
  #  開始時間を秒へ
  #  break_time_1_start_time = time_to_seconds(working_time.break_time_1_start_time.hour,
  #                                            working_time.break_time_1_start_time.min)
  #  終了時間を秒へ
  #  break_time_1_end_time = time_to_seconds(working_time.break_time_1_end_time.hour,
  #                                            working_time.break_time_1_end_time.min)
  #  休憩時間の算出(あとでマイナスする)
  #  break_time_1 = calc_break_time(break_time_1_start_time, break_time_1_end_time)
    
  #  休憩時間２
    
  #  開始時間を秒へ
  #  break_time_2_start_time = time_to_seconds(working_time.break_time_2_start_time.hour,
  #                                            working_time.break_time_2_start_time.min)
  #  終了時間を秒へ
  #  break_time_2_end_time = time_to_seconds(working_time.break_time_2_end_time.hour,
  #                                            working_time.break_time_2_end_time.min)
  #  休憩時間の算出(あとでマイナスする)
  #  break_time_2 = calc_break_time(break_time_2_start_time, break_time_2_end_time)
    
  #  休憩時間３
    
  #  開始時間を秒へ
  #  break_time_3_start_time = time_to_seconds(working_time.break_time_3_start_time.hour,
  #                                            working_time.break_time_3_start_time.min)
  #  終了時間を秒へ
  #  break_time_3_end_time = time_to_seconds(working_time.break_time_3_end_time.hour,
  #                                            working_time.break_time_3_end_time.min)
  #  休憩時間の算出(あとでマイナスする)
  #  break_time_3 = calc_break_time(break_time_3_start_time, break_time_3_end_time)
    
  #  (総)労働時間の算出
  #  @total_time = calc_total_work_time(break_time_1, break_time_2, break_time_3)
    
  #end
  #
  
  #def calc_total_work_time(break_time_1, break_time_2, break_time_3)
  #  if @end_time < @start_time
  #    終了時間より開始時間が大きい→日またがりとみなす(ex.22:00~5:00)
  #    total_time = (86400 - @start_time) + @end_time - break_time_1 - break_time_2 - break_time_3
  #  else
  #    その他は通常とみなす
  #    ex.9:00~16:00のような勤務は、Adusuでは小休憩を引かないようにしているが、標準版はそのままマイナスする
  #    
  #    total_time = @end_time - @start_time - break_time_1 - break_time_2 - break_time_3
  #  end
  #  return total_time
  #end
  
  
  #def calc_break_time(break_time_start_time, break_time_end_time)
    
  #  break_time = 0
    
  #  開始時間が休憩開始時間以上?
  #  if @start_time >= break_time_start_time
  #    if @start_time > break_time_end_time
  #      break_time = 0
  #    else
  #      休憩終了-開始時間
  #      break_time = break_time_end_time - @start_time
  #    end
  #  end
  
  #  #開始時間が休憩開始時間より前?
  #  if @start_time < break_time_start_time
  #    if @end_time >= break_time_end_time
  #      break_time = break_time_end_time - break_time_start_time
  #    elsif @end_time >= break_time_start_time && 
  #          #@end_time <= break_time_end_time
  #      break_time = @end_time - break_time_start_time
  #      日付が違う場合？？ → 考慮しない
  #    end
  #  end
    
  #  return break_time
  #end
  
  
  #時間・分を秒単位に変換
  #def time_to_seconds(hour, min)
  #  seconds = (hour * 3600) + (min *60)
  #  return seconds
  #end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_time
      @working_time = WorkingTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_time_params
      params.require(:working_time).permit(:employment_status_id, :working_time_start_time, :working_time_end_time, :overtime_start_time, :overtime_end_time, :overtime_early_start_time, :overtime_early_end_time, :overtime_midnight_start_time, :overtime_midnight_end_time, :break_time_1_start_time, :break_time_1_end_time, :break_time_2_start_time, :break_time_2_end_time, :break_time_3_start_time, :break_time_3_end_time)
    end
end

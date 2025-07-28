class ApplicationMailer < ActionMailer::Base
  
  #default from: "from@example.com"
  layout 'mailer'
  
  #標準仕様--会社名を載せる
  company = Company.first
  @company_name = ""
  if company.present?
    @company_name = company.name
  else
    @company_name = "送信者"  #ここは基本、通らない
  end
  #
  
  #for centos6(220209) 
  #default from:     "株式会社アデュース<adusudenki@gmail.com>"
  #default from:     @company_name + "<postmailerddxz@gmail.com>"
  #default from: @company_name + 'Acme <onboarding@resend.dev>'
  default from: @company_name + 'Acme <postmailerddxz@gmail.com>'
  
  #default from:     @company_name + "<adusudenki@gmail.com>"
  
  #↑カッコのメアドがないと555のエラーが出て送信できないので注意！！
  #        reply_to: "sample+reply@gmail.com"
  #layout 'mailer' 
 
end

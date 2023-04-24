Given(/^Se crea (.*) usuarios con template (.*) (.*) tarjetas válidas$/) do |number_users, template_file, valid_card|

  cant_user = 0
  begin
    create_user(template_file, valid_card)
    cant_user = cant_user + 1
  end while cant_user < number_users.to_i

end
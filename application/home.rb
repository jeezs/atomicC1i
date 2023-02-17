def home
  reset_size
  infos("Comme Une Image ... la société de rérénce pour les vidéos professionelles sur la région AURA")
  title(:homepage)
  clear_page
  fill_image('Court','Cam1','Application', 'concert')
  fill_title('Réalisation','Captation','Diffusion','Compétences')
  section_links(:real, :capt, :diff, :comp)

end


def real
  title('Réalisation')
  clear_page
  fill_image('dance',nil,  'reali_1', 'Drone')
  section_links(:real, :capt, :diff, :comp)
  text_found="Sylvain Godard crée la société de production audiovisuelle Comme une Image en 2001. Elle déploie son activité autour de productions exécutives internationales, locales, et réalise des projets multimédia pour des entreprises de tous secteurs (Banque, industriel, culturel…). Mue par son attrait pour les technologies innovantes et son énergie créative, Comme une Image a produit de nombreux projets."
  fill_color(nil, { red: 0, green: 0.3, blue: 0.3 },nil)

  fill_text(nil,text_found)
end

def capt
  title('Captation')
  clear_page
  fill_image(nil, 'roue', 'Video_Prod1', 'Plateau')
  fill_text(nil,nil,nil)
  fill_web('usQDazZKWAk')
  section_links(:real, :capt, :diff, :comp)
end

def diff
  title('Diffusion')
  clear_page
  fill_image('website',nil,nil, 'AR2')
  fill_video(nil, :madmax)
  fill_color(nil, nil,{ red: 0.3, green: 0, blue: 0.3 })
  txt_found="Nous savons intégrer vos vidéos dans une application compatible web, smartphone ou autonome.  La lecture interactive  des vidéos, et une navigation selon vos  propres critères,  permet une expérience de diffusion ludique et moderne pour vos utilisateurs et clients. "
  fill_text(nil,nil,txt_found,nil)
  section_links(:real, :capt, :diff, :comp)
end

def comp
  title('Compétences')

  clear_page
  fill_image('3D', :interactive,'Studio3', 'Drone')
  section_links(:real, :capt, :diff, :comp)
end
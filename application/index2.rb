# frozen_string_literal: true

####################### web site ################

def style
  base_size = 55
  {
    titles: :orange,
    main_titles: { red: 0.2, green: 0.2, blue: 0.2 },
    base_size: base_size,
    web_shadow: { blur: 16, left: 3, top: 3 },
    header: { id: :header, left: 0, right: 0, height: base_size, top: 0, bottom: :auto, width: :auto,
              color: { red: 0.15, green: 0.15, blue: 0.15 } },
    footer: { id: :footer, left: 0, right: 0, height: base_size, bottom: 0, top: :auto, width: :auto,
              color: { red: 0.15, green: 0.15, blue: 0.15 } },
    logo: { id: :logo, height: 39, top: 33, left: 30 },
    content: { id: :content, top: base_size, bottom: base_size / 2, left: 0, right: 0, width: :auto, height: :auto },
    c1i: { id: :c1i, top: base_size, bottom: base_size, left: 0, right: 0, width: :auto, height: :auto },
    rubriques: { id: :products_matrix, left: 0, width: 300, height: 450, parents: [:content], columns: { count: 2 }, rows: { count: 3 }, color: { red: 0.15, green: 0.15, blue: 0.15 },
                 cells: { particles: { margin: 15, color: { red: 0.15, green: 0.15, blue: 0.15 },
                                       smooth: 0, shadow: { blur: 16, left: 3, top: 3 } } } }
  }
end

##############################

@header = box({ id: style[:header][:id], left: style[:header][:left], right: style[:header][:right],
                top: style[:header][:top], bottom: style[:header][:bottom], height: style[:header][:height],
                color: style[:header][:color], width: style[:header][:width] })

# content
@content = box({ id: style[:content][:id], top: style[:content][:top], bottom: style[:content][:bottom],
                 width: style[:content][:width], height: style[:content][:height], left: style[:content][:left],
                 right: style[:content][:right], color: { red: 0.15, green: 0.15, blue: 0.15 }, overflow: :auto })

# bottom
@footer = box({ id: style[:footer][:id], left: style[:footer][:left], right: style[:footer][:right],
                bottom: style[:footer][:bottom], top: style[:footer][:top], height: style[:footer][:height],
                color: style[:footer][:color], width: style[:footer][:width] })

# C1I
@c1 = @header.image({ path: './medias/images/c1i_text.svg', id: style[:c1i][:id], size: '39%', center: true })
# @header.text({ data: '... Comme une image', color: { red: 0.5, green: 0.5, blue: 0.5 }, center: true, width: :auto, height: :auto, visual: { size: '5vw' } })

# logo
@logo = @header.image({ path: './medias/images/c1i_logo.svg', id: style[:logo][:id],
                        height: style[:logo][:height], center: :vertical, width: '9%', left: style[:logo][:left],
                        top: style[:logo][:top] })
deco_color = color({ red: 34 / 255, green: 255 / 255, blue: 29 / 255 })
deco_color2 = color(:orange)
@header.box({ attached: [deco_color.id], left: :auto, right: 0, height: 1, top: style[:base_size] / 2, width: '27%' })
@footer.box({ attached: [deco_color2.id], left: :auto, right: 0, height: 1, top: 12, width: '100%' })

##############################

rubriques = matrix(style[:rubriques])
cell_1 = rubriques.cell(0)
cell_2 = rubriques.cell(1)
cell_3 = rubriques.cell(2)
cell_4 = rubriques.cell(3)
cell_5 = rubriques.cell(4)

# cell_5.color(:red)
cell_5.touch(:down) do
  home(cell_1, cell_2, cell_3, cell_4)
end

@logo.touch(:down) do
  home(cell_1, cell_2, cell_3, cell_4)
end

rubriques.fusion(rows: { 2 => [0, 1] })

def unbind(cell_1, cell_2, cell_3, cell_4)
  clear_cell(cell_1)
  clear_cell(cell_2)
  clear_cell(cell_3)
  clear_cell(cell_4)
  cell_1.unbind(:tap)
  cell_2.unbind(:tap)
  cell_3.unbind(:tap)
  cell_4.unbind(:tap)
end


def clear_cell(cell)
  cell.children.each do |child_id|
    child_found=grab(child_id)
    child_found.delete(true) if child_found
  end
  cell.children([])
end

def relink(cell_1, cell_2, cell_3, cell_4, link1, link2, link3, link4)
  cell_1.touch(:down) do
    send(link1, cell_1, cell_2, cell_3, cell_4)
  end
  cell_2.touch(:down) do
    send(link2, cell_1, cell_2, cell_3, cell_4)
  end
  cell_3.touch(:down) do
    send(link3, cell_1, cell_2, cell_3, cell_4)
  end
  cell_4.touch(:down) do
    send(link4, cell_1, cell_2, cell_3, cell_4)
  end
end

def labelize(cell_1, cell_2, cell_3, cell_4, item1, item2, item3, item4)
  cell_1.text({ data: item1 })
  cell_2.text({ data: item2 })
  cell_3.text({ data: item3 })
  cell_4.text({ data: item4 })
end

def imagesize(cell_1, cell_2, cell_3, cell_4, item1, item2, item3, item4)
  cell_1.image("#{item1}.jpg")
  cell_2.image("#{item2}.jpg")
  cell_3.image("#{item3}.jpg")
  cell_4.image("#{item4}.jpg")
end

def colorize(cell_1, cell_2, cell_3, cell_4, color)
  cell_1.color(color)
  cell_2.color(color)
  cell_3.color(color)
  cell_4.color(color)
end

def home(cell_1, cell_2, cell_3, cell_4)
  unbind(cell_1, cell_2, cell_3, cell_4)
  relink(cell_1, cell_2, cell_3, cell_4, :realisations, :captation, :diffusion, :competence)
  imagesize(cell_1, cell_2, cell_3, cell_4,'Video_Prod1','Video_Prod2','Socialpasnet','Video_Prod5')
  labelize(cell_1, cell_2, cell_3, cell_4, :realisations, :captation, :diffusion, :competence)
  # colorize(cell_1, cell_2, cell_3, cell_4, :lightgray)
  # cell_1.touch(:down) do
  #   realisations(cell_1, cell_2, cell_3, cell_4)
  # end
  # cell_2.touch(:down) do
  #   captation(cell_1, cell_2, cell_3, cell_4)
  # end
  # cell_3.touch(:down) do
  #   diffusion(cell_1, cell_2, cell_3, cell_4)
  # end
  # cell_4.touch(:down) do
  #   competence(cell_1, cell_2, cell_3, cell_4)
  # end
end

def realisations(cell_1, cell_2, cell_3, cell_4)
  unbind(cell_1, cell_2, cell_3, cell_4)
  # relink(cell_1, cell_2, cell_3, cell_4,:realisations, :captation, :diffusion, :competence)
  colorize(cell_1, cell_2, cell_3, cell_4, :red)
  labelize(cell_1, cell_2, cell_3, cell_4, :realisations, :captation, :diffusion, :competence)
  # imagesize(cell_1, cell_2, cell_3, cell_4, :realisations, :captation, :diffusion, :competence)

  cell_1.touch(:down) do
    alert "realisations cell1"
  end
end

def captation(cell_1, cell_2, cell_3, cell_4)
  unbind(cell_1, cell_2, cell_3, cell_4)
  colorize(cell_1, cell_2, cell_3, cell_4, :blue)
  cell_1.touch(:down) do
    alert "captation cell1"
  end
end

def diffusion(cell_1, cell_2, cell_3, cell_4)
  unbind(cell_1, cell_2, cell_3, cell_4)
  colorize(cell_1, cell_2, cell_3, cell_4, :yellow)
end

def competence(cell_1, cell_2, cell_3, cell_4)
  unbind(cell_1, cell_2, cell_3, cell_4)
  colorize(cell_1, cell_2, cell_3, cell_4, :orange)
end

home(cell_1, cell_2, cell_3, cell_4)

mail = @footer.image({ path: './medias/images/icons/mail_orange.svg', size: 25, left: 16, bottom: 8 })
facebook = @footer.image({ path: './medias/images/logos/orange/Facebook.svg', size: 25, right: 16, bottom: 8 })
instagram = @footer.image({ path: './medias/images/logos/orange/instagram.svg', size: 25, right: 56, bottom: 8 })
youtube = @footer.image({ path: './medias/images/logos/orange/youtube.svg', size: 33, right: 95, bottom: 4 })
vimeo = @footer.image({ path: './medias/images/logos/orange/vimeo.svg', size: 25, right: 138, bottom: 8 })
tiktok = @footer.image({ path: './medias/images/logos/orange/TikTok.svg', size: 25, right: 170, bottom: 8 })
twitter = @footer.image({ path: './medias/images/logos/orange/Twitter.svg', size: 25, right: 200, bottom: 8 })

###################################### start touches ###################################
#
mail.touch(:down) do
  `
    var recipient = "contact@c1i.eu";
    var subject = "Demande de renseignement";
    var body = "Contenu de l'e-mail";
    window.location.href = "mailto:" + recipient + "?subject=" + subject + "&body=" + body;
`
end

facebook.touch(:down) do
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  alert :facebookingthezuckerdebite
  # web({ path: 'https://www.youtube.com/embed/usQDazZKWAk',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

youtube.touch(:down) do
  alert :youtubeingthegogol
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # w= web({ path: 'https://vimeo.com/showcase/9266149/embed',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
  # w.touch(:down) do
  #   puts "okokok"
  #   w.delete(true)
  #   w.left(900)
  # end

end

instagram.touch(:down) do
  alert :instagramingthenoobs
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

vimeo.touch(:down) do
  alert :vimeoingthebelette
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/xYAC0puL6Ro', center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

tiktok.touch(:down) do
  alert :tiktokingthechintok

  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

twitter.touch(:down) do
  alert :twitteringthemusk

  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

matrix_ratio = rubriques.height.value / rubriques.width.value
$window.on :resize do
  rubriques.resize($window.view.width, $window.view.width * matrix_ratio)
  rubriques.cell(4).height(rubriques.cell(4).height.value / 2)
end

rubriques.resize($window.view.width, $window.view.width * matrix_ratio)
rubriques.cell(4).height(rubriques.cell(4).height.value / 2)
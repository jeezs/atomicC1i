# frozen_string_literal: true

####################### web site ################
base_size = 55
style = {
  titles: :orange,
  main_titles: { red: 0.2, green: 0.2, blue: 0.2 },

  web_shadow: { blur: 16, left: 3, top: 3 },
  header: { id: :header, left: 0, right: 0, height: base_size, top: 0, bottom: :auto, width: :auto,
            color: { red: 0.15, green: 0.15, blue: 0.15 } },
  footer: { id: :footer, left: 0, right: 0, height: base_size, bottom: 0, top: :auto, width: :auto,
            color: { red: 0.15, green: 0.15, blue: 0.15 } },
  logo: { id: :logo, height: 39, top: 33, left: 30 },
  content: { id: :content, top: base_size, bottom: base_size / 2, left: 0, right: 0, width: :auto, height: :auto },
  c1i: { id: :c1i, top: base_size, bottom: base_size, left: 0, right: 0, width: :auto, height: :auto },
  products: { id: :products_matrix, columns: { count: 2 }, rows: { count: 2 }, color: { red: 0.15, green: 0.15, blue: 0.15 },
              cells: { particles: { margin: 15, color: { red: 0.15, green: 0.15, blue: 0.15 },
                                    smooth: 0, shadow: { blur: 16, left: 3, top: 3 } } } }
}

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
@header.box({ attached: [deco_color.id], left: :auto, right: 0, height: 1, top: base_size / 2, width: '27%' })
@footer.box({ attached: [deco_color2.id], left: :auto, right: 0, height: 1, top: 12, width: '100%' })

products = matrix(style[:products])
@nb_of_cells = products.instance_variable_get("@columns") * products.instance_variable_get("@rows")
matrix_ratio = products.height.value / products.width.value

def clear_cell(cell)
  cell.children.each do |child|
    child_found=grab(child)
    # puts child_found
    grab(child).delete(true)
    # grab(child).unbind(:tap)
  end
  cell.children([])
end

def clear_products(matrix_found, nb_of_cells)
  nb_of_cells.times do |cell_number|
    cell_found = matrix_found.cell(cell_number)
    clear_cell(cell_found)
  end
end

def init_products(matrix_found, nb_of_cells, ratio, style, titles_color)
  @header.touch(true) do
    home(matrix_found, nb_of_cells, style)
  end
  matrix_found.resize($window.view.width, $window.view.width * ratio)
  matrix_found.parents([:content])
  matrix_found.left(0)
  matrix_found.top(0)
  matrix_found.cell(0).touch(true) do
    realisation(matrix_found, nb_of_cells, titles_color)
  end
  matrix_found.cell(1).touch(true) do
    captation(matrix_found, nb_of_cells, titles_color)
  end
  matrix_found.cell(2).touch(true) do
    diffusion(matrix_found, nb_of_cells, titles_color)
  end
  matrix_found.cell(3).touch(true) do
    competence(matrix_found, nb_of_cells, titles_color)
  end
  home(matrix_found, nb_of_cells = @nb_of_cells, style)
end

def home(matrix_found, nb_of_cells, style)
  titles_color = style[:titles]
  main_titles_color = style[:main_titles]
  if grab(:external_web)
    grab(:external_web).delete(true)
  end
  clear_products(matrix_found, nb_of_cells)
  cell_1 = matrix_found.cell(0)
  cell_2 = matrix_found.cell(1)
  cell_3 = matrix_found.cell(2)
  cell_4 = matrix_found.cell(3)
  # cell_1.unbind(:tap)
  # cell_2.unbind(:tap)
  # cell_3.unbind(:tap)
  # cell_4.unbind(:tap)


  cell_1.overflow(:hidden)

  cell_1.touch(true) do
    realisation(matrix_found, nb_of_cells, titles_color)
  end
  cell_2.touch(true) do
    captation(matrix_found, nb_of_cells, titles_color)
  end
  cell_3.touch(true) do
    diffusion(matrix_found, nb_of_cells, titles_color)
  end
  cell_4.touch(true) do
    competence(matrix_found, nb_of_cells, titles_color)
  end

  cell_1.image({ path: "./medias/images/Video_prod1.jpg", left: 0, top: 0, size: '100%' })
  cell_1.text({ data: :réalisation, center: :horizontal, top: 3, color: main_titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_2.image({ path: "./medias/images/Video_Prod2.jpg", left: 0, top: 0, size: '100%' })
  cell_2.text({ data: :captation, center: :horizontal, top: 3, color: main_titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_3.image({ path: "./medias/images/Video_Prod4.jpg", left: 0, top: 0, size: '100%' })

  cell_3.text({ data: :diffusion, center: :horizontal, top: 3, color: main_titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_4.image({ path: "./medias/images/Video_Prod5.jpg", left: 0, top: 0, size: '100%' })
  cell_4.text({ data: :compétences, center: :horizontal, top: 3, color: main_titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
end
titles_color = style[:titles]
init_products(products, @nb_of_cells, matrix_ratio, style, titles_color)

$window.on :resize do
  puts products.children
  products.resize($window.view.width, $window.view.width * matrix_ratio)
end

# pages
def captation(matrix_found, nb_of_cells, titles_color)
  clear_products(matrix_found, nb_of_cells)
  cell_1 = matrix_found.cell(0)
  cell_2 = matrix_found.cell(1)
  cell_3 = matrix_found.cell(2)
  cell_4 = matrix_found.cell(3)
  # cell_1.unbind(:tap)
  # cell_2.unbind(:tap)
  # cell_3.unbind(:tap)
  # cell_4.unbind(:tap)

  cell_1.image({ path: "./medias/images/Plateau2.jpg", left: 0, top: 0, size: '100%' })
  cell_1.text({ data: 'Evenements', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_2.image({ path: "./medias/images/roue.jpg", left: 0, top: 0, size: '100%' })
  cell_2.text({ data: 'Time-Lapse', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_3.image({ path: "./medias/images/Concert.jpg", left: 0, top: 0, size: '100%' })
  cell_3.text({ data: 'Concerts', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_4.image({ path: "./medias/images/dance.jpg", left: 0, top: 0, size: '100%' })
  cell_4.text({ data: 'Spectacles', center: :horizontal, top: 3, color: titles_color, visual: { size: '63vwvw' },
                width: :auto, height: :auto })
end

def realisation(matrix_found, nb_of_cells, titles_color)
  clear_products(matrix_found, nb_of_cells)
  cell_1 = matrix_found.cell(0)
  cell_2 = matrix_found.cell(1)
  cell_3 = matrix_found.cell(2)
  cell_4 = matrix_found.cell(3)
  # cell_1.unbind(:tap)
  # cell_2.unbind(:tap)
  # cell_3.unbind(:tap)
  # cell_4.unbind(:tap)
  # puts "c1 : #{cell_1.class}"
  # cell_1.color(:red)
  # cell_1.touch(true) do
  #   documentaire(matrix_found, nb_of_cells)
  # end
  cell_1.image({ path: "./medias/images/reali_1.jpg", left: 0, top: 0, size: '100%' })

  cell_1.text({ data: 'Documentaire', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  doc=<<STR
Comme une image développe la production de documentaires en privilégiant la maîtrise technique au service de la sensibilité et de l’humilité. En quête d’ouverture d’esprit sur le monde et d’une vision singulière , nos créations concernent aujourd’hui autant la télévision que le cinéma.
STR
  court=<<STR
  
La création originale est au coeur du projet Comme Une Image. De l’écriture à la diffusion, nous produisons depuis 20 ans des courts métrages .
STR
  cell_1.text({ data: doc, top: '6vw', left: 9, right: 9,bottom: 6,top: false,color: :lightgray, visual: { size: '2vw' },
                width: :auto, height: :auto })
  cell_2.image({ path: "./medias/images/Court2.jpg", left: 0, top: 0, size: '100%' })
  cell_2.text({ data: 'Court Métrages', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_2.text({ data: court, top: '6vw', left: 9, right: 9,bottom: 6,top: false,color: :lightgray, visual: { size: '2vw' },
                width: :auto, height: :auto })
  cell_3.image({ path: "./medias/images/Cam2.jpg", left: 0, top: 0, size: '100%' })
  cell_3.text({ data: 'Institutionnel', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_4.image({ path: "./medias/images/reali_2.jpg", left: 0, top: 0, size: '100%' })

  cell_4.text({ data: 'Vidéo Clips', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
end

def diffusion(matrix_found, nb_of_cells,titles_color)
  clear_products(matrix_found, nb_of_cells)
  cell_1 = matrix_found.cell(0)
  cell_2 = matrix_found.cell(1)
  cell_3 = matrix_found.cell(2)
  cell_4 = matrix_found.cell(3)
  # cell_1.unbind(:tap)
  # cell_2.unbind(:tap)
  # cell_3.unbind(:tap)
  # cell_4.unbind(:tap)
  cell_1.image({ path: "./medias/images/Socialpasnet.jpg", left: 0, top: 0, size: '100%' })

  cell_1.text({ data: 'Réseaux sociaux', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_2.image({ path: "./medias/images/reali_1.jpg", left: 0, top: 0, size: '100%' })
  cell_2.text({ data: 'Créations Site internet', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_3.image({ path: "./medias/images/reali_1.jpg", left: 0, top: 0, size: '100%' })
  cell_3.text({ data: 'Créations Applications', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_4.image({ path: "./medias/images/interactive.jpg", left: 0, top: 0, size: '100%' })
  cell_4.text({ data: 'Vidéo Intéractive', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
end

def competence(matrix_found, nb_of_cells,titles_color)
  clear_products(matrix_found, nb_of_cells)
  cell_1 = matrix_found.cell(0)
  cell_2 = matrix_found.cell(1)
  cell_3 = matrix_found.cell(2)
  cell_4 = matrix_found.cell(3)
  # cell_1.unbind(:tap)
  # cell_2.unbind(:tap)
  # cell_3.unbind(:tap)
  # cell_4.unbind(:tap)
  cell_1.image({ path: "./medias/images/Drone.jpg", left: 0, top: 0, size: '100%' })
  cell_1.text({ data: 'Drones', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_2.image({ path: "./medias/images/Plateau.jpg", left: 0, top: 0, size: '100%' })
  cell_2.text({ data: 'Multicams', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_3.image({ path: "./medias/images/AR2.jpg", left: 0, top: 0, size: '100%' })
  cell_3.text({ data: 'VR-AR', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })
  cell_4.image({ path: "./medias/images/3D.jpg", left: 0, top: 0, size: '100%' })
  cell_4.text({ data: '3D', center: :horizontal, top: 3, color: titles_color, visual: { size: '3vw' },
                width: :auto, height: :auto })

end

def documentaire(matrix_found, nb_of_cells)
  # wait 3 do
  # cell_1.width(matrix_found.width.value - 30)
  # cell_1.height(matrix_found.height.value - 30)
  # id_found = cell_1.id.value
  # puts matrix_found.width.value
  # `document.getElementById(#{id_found}).style.zIndex = "+3";`
  # end
  # clear_products(matrix_found, nb_of_cells)
  # cell_1 = matrix_found.cell(0)
  # cell_2 = matrix_found.cell(1)
  # cell_3 = matrix_found.cell(2)
  # cell_4 = matrix_found.cell(3)
  # cell_1.unbind(:tap)
  # cell_2.unbind(:tap)
  # cell_3.unbind(:tap)
  # cell_4.unbind(:tap)
  #
  # cell_1.text({ data: 'Evenements', center: :horizontal, top: 3, color: :lightgray, visual: { size: 33 } })
  # cell_2.text({ data: 'Time-Lapse', center: :horizontal, top: 3, visual: { size: 33 }, color: :lightgray })
  # cell_3.text({ data: 'Concerts', center: :horizontal, top: 3, visual: { size: 33 }, color: :lightgray })
  # cell_4.text({ data: 'Spectacles', center: :horizontal, top: 3, visual: { size: 33 }, color: :lightgray })

end

mail = @footer.image({ path: './medias/images/icons/mail_orange.svg', size: 25, left: 16, bottom: 8 })

facebook = @footer.image({ path: './medias/images/logos/orange/Facebook.svg', size: 25, right: 16, bottom: 8 })
instagram = @footer.image({ path: './medias/images/logos/orange/instagram.svg', size: 25, right: 56, bottom: 8 })
youtube = @footer.image({ path: './medias/images/logos/orange/youtube.svg', size: 33, right: 95, bottom: 4 })
vimeo = @footer.image({ path: './medias/images/logos/orange/vimeo.svg', size: 25, right: 138, bottom: 8 })
tiktok = @footer.image({ path: './medias/images/logos/orange/TikTok.svg', size: 25, right: 170, bottom: 8 })
twitter = @footer.image({ path: './medias/images/logos/orange/Twitter.svg', size: 25, right: 200, bottom: 8 })

###################################### start touches ###################################
#
mail.touch(true) do
  `
    var recipient = "contact@c1i.eu";
    var subject = "Demande de renseignement";
    var body = "Contenu de l'e-mail";
    window.location.href = "mailto:" + recipient + "?subject=" + subject + "&body=" + body;
`
end

facebook.touch(true) do
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  alert :facebook
  # web({ path: 'https://www.youtube.com/embed/usQDazZKWAk',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

youtube.touch(true) do
  # alert :youtube
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # w= web({ path: 'https://vimeo.com/showcase/9266149/embed',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
  # w.touch(true) do
  #   puts "okokok"
  #   w.delete(true)
  #   w.left(900)
  # end

end

instagram.touch(true) do
  alert :instagram
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end


vimeo.touch(true) do
  alert  :vimeo
  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/xYAC0puL6Ro', center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

tiktok.touch(true) do
  alert :tiktok

  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end

twitter.touch(true) do
  alert :twitter

  # if grab(:external_web)
  #   grab(:external_web).delete(true)
  # end
  # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
end
###################################### end touches ###################################
class WebObject

  def initialize(object)
    @webobject = object
  end

  def style
    # `#{@webobject}.style`
  end

  def web_object
    @webobject
  end
end

class Atome
  def webobject
    web_object = `document.getElementById(#{id.value})`
    WebObject.new(web_object)
  end
end

# a = cell_4.webobject
# a.style
# `#{a}.style.left='500px'`

# t = text({ data: :hello, visual: { size: "50vw" }, height: :auto, width: :auto })




########################
def experiments
  #   `
  #   // This const is used to store and get all atome created canvas by id
  # const Atome_canvas={}
  # `

  `

var div = document.getElementById('view');

var canvas = document.createElement("canvas");
canvas.width = div.clientWidth;
canvas.height = div.clientHeight;

canvas_id='_canvas';
canvas.id = canvas_id;
div.appendChild(canvas);
var img = new Image();
img.src = './medias/images/3D.jpg';
img.onload = function() {
    var fab_canvas = new fabric.Canvas(canvas_id);
//fab_canvas.set('id', 'myCanvasId');
Atome_canvas.myCanvasId=fab_canvas
    var image = new fabric.Image(img);
image.hasControls = false; // hide the helpers
image.selectable = false; // make the image unselectable
image.hoverCursor = 'default'; // Change the cursor
image.evented = false;// Deactivate the lasso
fab_canvas.selection = false //make the canvas unselectable (no lasso possible on the whole canvas)
 image.id= 'myImageId';
    fab_canvas.add(image);
  fab_canvas.getObjects().forEach(function(o) {
          if(o.id == 'myImageId') {
              //console.log(o.id)
o.filters.push(new fabric.Image.filters.BlendColor({color: 'red'}));
o.applyFilters();
          }
      })
}


setTimeout(() => {

var getted_canvas = Atome_canvas.myCanvasId
var rect = new fabric.Rect({
  left: 100,
  top: 100,
  fill: 'blue',
  width: 20,
  height: 20,
  angle: 45

});

getted_canvas.add(rect);
   getted_canvas.getObjects().forEach(function(o) {
          if(o.id == 'myImageId') {
delete o.filters[0]; // delete the previous filter

o.filters.push(new fabric.Image.filters.BlendColor({color: 'pink'}));
o.applyFilters();
          }
      })

}, 2000)

`
end
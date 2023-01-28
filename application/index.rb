# frozen_string_literal: true

####################### web site ################

# def style
#   base_size = 55
#   {
#     titles: :orange,
#     title: { center: :horizontal, top: base_size, id: :title },
#     main_titles: { red: 0.2, green: 0.2, blue: 0.2 },
#     base_size: base_size,
#     web_shadow: { blur: 16, left: 3, top: 3 },
#     header: { id: :header, left: 0, right: 0, height: base_size, top: 0, bottom: :auto, width: :auto, overflow: :visible,
#               color: { red: 0.15, green: 0.15, blue: 0.15 } },
#     footer: { id: :footer, left: 0, right: 0, height: base_size, bottom: 0, top: :auto, width: :auto,
#               color: { red: 0.15, green: 0.15, blue: 0.15 } },
#     logo: { id: :logo, height: 39, top: 33, left: 30 },
#     content: { id: :content, top: base_size, bottom: base_size / 2, left: 0, right: 0, width: :auto, height: :auto },
#     c1i: { id: :c1i, top: base_size, bottom: base_size, left: 0, right: 0, width: :auto, height: :auto },
#     rubriques: { id: :rubriques, left: 0, width: 300, height: 450, parents: [:content], columns: { count: 2 }, rows: { count: 3 }, color: { red: 0.15, green: 0.15, blue: 0.15 },
#                  cells: { particles: { margin: 15, color: { red: 0.15, green: 0.15, blue: 0.15 },
#                                        smooth: 0, shadow: { blur: 16, left: 3, top: 3 } } } }
#   }
# end
#
# ##############################
#
# # content
# @content = box({ id: style[:content][:id], top: style[:content][:top], bottom: style[:content][:bottom],
#                  width: style[:content][:width], height: style[:content][:height], left: style[:content][:left],
#                  right: style[:content][:right], color: { red: 0.15, green: 0.15, blue: 0.15 }, overflow: :auto })
# # header
# @header = box({ id: style[:header][:id], left: style[:header][:left], right: style[:header][:right],
#                 top: style[:header][:top], bottom: style[:header][:bottom], height: style[:header][:height],
#                 color: style[:header][:color], width: style[:header][:width] })
# # bottom
# @footer = box({ id: style[:footer][:id], left: style[:footer][:left], right: style[:footer][:right],
#                 bottom: style[:footer][:bottom], top: style[:footer][:top], height: style[:footer][:height],
#                 color: style[:footer][:color], width: style[:footer][:width] })
#
# # C1I
# @c1 = @header.image({ path: './medias/images/c1i_text.svg', id: style[:c1i][:id], size: '39%', center: true })
# # @header.text({ data: '... Comme une image', color: { red: 0.5, green: 0.5, blue: 0.5 }, center: true, width: :auto, height: :auto, visual: { size: '5vw' } })
#
# # logo
# @logo = @header.image({ path: './medias/images/c1i_logo.svg', id: style[:logo][:id],
#                         height: style[:logo][:height], center: :vertical, width: '9%', left: style[:logo][:left],
#                         top: style[:logo][:top] })
# deco_color = color({ red: 34 / 255, green: 255 / 255, blue: 29 / 255 })
# deco_color2 = color(:orange)
# @header.box({ attached: [deco_color.id], left: :auto, right: 0, height: 1, top: style[:base_size] / 2, width: '27%' })
# @footer.box({ attached: [deco_color2.id], left: :auto, right: 0, height: 1, top: 12, width: '100%' })
# @header.text({ data: 'bienvenue' }.merge(style[:title]))
#
# ##############################
#
# rubriques = matrix(style[:rubriques])
#
# def cell_1
#   grab(:rubriques).cell(0)
# end
#
# def cell_2
#   grab(:rubriques).cell(1)
# end
#
# def cell_3
#   grab(:rubriques).cell(2)
# end
#
# def cell_4
#   grab(:rubriques).cell(3)
# end
#
# def cell_5
#   grab(:rubriques).cell(4)
# end
#
#
# cell_5.touch(:down) do
#   home
# end
#
# @logo.touch(:down) do
#   home
# end
# grab(:title).touch(:down) do
#   home
# end
#
# rubriques.fusion(rows: { 2 => [0, 1] })
#
# def clear_cell(cell)
#   cell.children.each do |child_id|
#     child_found = grab(child_id)
#     child_found.delete(true) if child_found
#   end
#   cell.children([])
# end
#
# def unbind
#   clear_cell(cell_1)
#   clear_cell(cell_2)
#   clear_cell(cell_3)
#   clear_cell(cell_4)
#   cell_1.unbind(:tap)
#   cell_2.unbind(:tap)
#   cell_3.unbind(:tap)
#   cell_4.unbind(:tap)
# end
#
# def relink(link1, link2, link3, link4)
#   cell_1.touch(:down) do
#     send(link1, cell_1, cell_2, cell_3, cell_4)
#   end
#   cell_2.touch(:down) do
#     send(link2, cell_1, cell_2, cell_3, cell_4)
#   end
#   cell_3.touch(:down) do
#     send(link3, cell_1, cell_2, cell_3, cell_4)
#   end
#   cell_4.touch(:down) do
#     send(link4, cell_1, cell_2, cell_3, cell_4)
#   end
# end
#
# def labelize(item1, item2, item3, item4)
#   wait 0.0015 do
#     cell_1.text({ data: item1 })
#     cell_2.text({ data: item2 })
#     cell_3.text({ data: item3 })
#     cell_4.text({ data: item4 })
#   end
#
# end
#
# def imagize(item1, item2, item3, item4)
#   wait 0.001 do
#     cell_1.image({ path: "./medias/images/#{item1}.jpg", size: '100% ', left: 0, top: 0 })
#     cell_2.image({ path: "./medias/images/#{item2}.jpg", size: '100% ', left: 0, top: 0 })
#     cell_3.image({ path: "./medias/images/#{item3}.jpg", size: '100% ', left: 0, top: 0 })
#     cell_4.image({ path: "./medias/images/#{item4}.jpg", size: '100% ', left: 0, top: 0 })
#   end
#
# end
#
# def colorize(color)
#   cell_1.color(color)
#   cell_2.color(color)
#   cell_3.color(color)
#   cell_4.color(color)
# end
#
# def home
#   unbind
#   relink(:realisations, :captation, :diffusion, :competence)
#   imagize('Video_Prod1', 'Video_Prod2', 'Video_Prod4', 'Video_Prod5')
#   labelize(:realisations, :captation, :diffusion, :competence)
#   grab(:title).data('Bienvenue')
# end
#
# def realisations
#   grab(:title).data('réalisations')
#   unbind
#   # relink(:realisations, :captation, :diffusion, :competence)
#   imagize('Concert', 'Court', 'Studio', 'reali_1')
#   labelize(:documentaire, :court, :institutionel, :videoclips)
#   cell_1.touch(:down) do
#     alert "realisations cell1"
#   end
# end
#
# def captation
#   grab(:title).data('Captations')
#   unbind
#   imagize('Plateau', 'roue', 'Concert', 'dance')
#   labelize('Evénementiel', 'Time-Lapse', 'Concerts', 'Spectacles')
#   cell_1.touch(:down) do
#     alert "captation cell1"
#   end
# end
#
# def diffusion
#   grab(:title).data('Diffusion')
#   unbind
#   imagize('Socialpasnet', 'Website', 'Application', 'interactive')
#   labelize('Réseaux Sociaux', 'Création Site Web', 'Création Applications', 'Vidéos interactive')
#
#   # colorize(:yellow)
# end
#
# def competence
#   grab(:title).data('Compétence')
#   unbind
#   imagize('Drone', 'Plateau', 'AR2', '3D')
#   labelize('Drone', 'Multi-cams', 'VR-AR', '3D')
#
#   # colorize(:orange)
# end
#
# home
#
# mail = @footer.image({ path: './medias/images/icons/mail_orange.svg', size: 25, left: 16, bottom: 8 })
# facebook = @footer.image({ path: './medias/images/logos/orange/Facebook.svg', size: 25, right: 16, bottom: 8 })
# instagram = @footer.image({ path: './medias/images/logos/orange/instagram.svg', size: 25, right: 56, bottom: 8 })
# youtube = @footer.image({ path: './medias/images/logos/orange/youtube.svg', size: 33, right: 95, bottom: 4 })
# vimeo = @footer.image({ path: './medias/images/logos/orange/vimeo.svg', size: 25, right: 138, bottom: 8 })
# tiktok = @footer.image({ path: './medias/images/logos/orange/TikTok.svg', size: 25, right: 170, bottom: 8 })
# twitter = @footer.image({ path: './medias/images/logos/orange/Twitter.svg', size: 25, right: 200, bottom: 8 })
#
# ###################################### start touches ###################################
# #
# mail.touch(:down) do
#   `
#     var recipient = "contact@c1i.eu";
#     var subject = "Demande de renseignement";
#     var body = "Contenu de l'e-mail";
#     window.location.href = "mailto:" + recipient + "?subject=" + subject + "&body=" + body;
# `
# end
#
# facebook.touch(:down) do
#   # if grab(:external_web)
#   #   grab(:external_web).delete(true)
#   # end
#   alert :facebookingthezuckerdebite
#   # web({ path: 'https://www.youtube.com/embed/usQDazZKWAk',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
# end
#
# youtube.touch(:down) do
#   alert :youtubeingthegogol
#   # if grab(:external_web)
#   #   grab(:external_web).delete(true)
#   # end
#   # w= web({ path: 'https://vimeo.com/showcase/9266149/embed',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
#   # w.touch(:down) do
#   #   puts "okokok"
#   #   w.delete(true)
#   #   w.left(900)
#   # end
#
# end
#
# instagram.touch(:down) do
#   alert :instagramingthenoobs
#   # if grab(:external_web)
#   #   grab(:external_web).delete(true)
#   # end
#   # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
# end
#
# vimeo.touch(:down) do
#   alert :vimeoingthebelette
#   # if grab(:external_web)
#   #   grab(:external_web).delete(true)
#   # end
#   # web({ path: 'https://www.youtube.com/embed/xYAC0puL6Ro', center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
# end
#
# tiktok.touch(:down) do
#   alert :tiktokingthechintok
#
#   # if grab(:external_web)
#   #   grab(:external_web).delete(true)
#   # end
#   # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
# end
#
# twitter.touch(:down) do
#   alert :twitteringthemusk
#
#   # if grab(:external_web)
#   #   grab(:external_web).delete(true)
#   # end
#   # web({ path: 'https://www.youtube.com/embed/fkaxf_C3ezE',  center: true, width: '70%', height: '70%', shadow: style[:web_shadow] })
# end
#
# matrix_ratio = rubriques.height.value / rubriques.width.value
# $window.on :resize do
#   rubriques.resize($window.view.width, $window.view.width * matrix_ratio)
#   rubriques.cell(4).height(rubriques.cell(4).height.value / 2)
# end
#
# rubriques.resize($window.view.width, $window.view.width * matrix_ratio)
# rubriques.cell(4).height(rubriques.cell(4).height.value / 2)

def js_image(parent,path)
  `
var div = document.getElementById(#{parent});
var canvas = document.createElement("canvas");
canvas.width = div.clientWidth;
canvas.height = div.clientHeight;
canvas_id=#{parent}+'_canvas';
canvas.id = canvas_id;
div.appendChild(canvas);
var img = new Image();
img.src = #{path};
img.onload = function() {
    // Créer un canvas et y ajouter l'image
    var canvas = new fabric.Canvas(canvas_id);
    var image = new fabric.Image(img);
    canvas.add(image);

    // Appliquer un filtre de colorisation rouge
    image.filters.push(new fabric.Image.filters.BlendColor({
        color: '#FF0000',
        opacity: 0.5
    }));
    image.applyFilters();
    // Afficher l'image colorisée sur le canvas
    canvas.renderAll();
}


`
end

def js_tint

end

# js_image(:view,'./medias/images/3D.jpg')

# grab(:view).delete(true)


# `
# var div = document.getElementById('view');
# var canvas = document.createElement("canvas");
# canvas.width = div.clientWidth;
# canvas.height = div.clientHeight;
# canvas_id='_canvas';
# canvas.id = canvas_id;
# div.appendChild(canvas);
# var img = new Image();
# img.src = './medias/images/3D.jpg';
# img.onload = function() {
#     var fab_canvas = new fabric.Canvas(canvas_id);
# fab_canvas.set('id', 'myCanvasId');
#     var image = new fabric.Image(img);
#  image.id= 'myImageId';
#     fab_canvas.add(image);
#
#   fab_canvas.getObjects().forEach(function(o) {
#           if(o.id == 'myImageId') {
#               console.log(o.id)
# o.filters.push(new fabric.Image.filters.BlendColor({color: '#FF0000'}));
# o.applyFilters();
#           }
#       })
# }
#
# `

`

const Fabric_canvas={}
`

`//

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
Fabric_canvas.myCanvasId=fab_canvas
    var image = new fabric.Image(img);
image.hasControls = false;
image.selectable = false;
image.hoverCursor = 'default';
image.evented = false;
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


  console.log("Delayed for 1 second.");
var getted_canvas = Fabric_canvas.myCanvasId
getted_canvas.selection = false
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
delete o.filters[0];

o.filters.push(new fabric.Image.filters.BlendColor({color: 'pink'}));
o.applyFilters();
          }
      })

}, 1000)

`

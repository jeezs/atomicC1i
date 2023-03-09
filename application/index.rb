# frozen_string_literal: true


# Last working version : atome version: 0.5.3.6.9
`
  // This const is used to store and get all atome created canvas by id
const Atome_canvas={}
`

###### Fabric basic - Image coloring #########
# new({ atome: :image })
# new({ sanitizer: :image }) do |params|
#   unless params.instance_of? Hash
#     # TODO : we have to convert all image to png or maintain a database with extension
#     params = { path: "./medias/images/#{params}" }
#   end
#   default_renderer = Essentials.default_params[:render_engines]
#   generated_id = params[:id] || "image_#{Universe.atomes.length}"
#   generated_render = params[:renderers] || default_renderer
#   generated_parents = params[:parents] || id.value
#   # TODO : the line below should get the value from default params Essentials
#   temp_default = { renderers: generated_render, id: generated_id, type: :image, parents: [generated_parents],
#                    children: [], width: 99, height: 99, path: './medias/images/atome.svg' }
#   params = temp_default.merge(params)
#   params
# end

# new({ browser: :image }) do |_user_prc|
#   @browser_type = :div
#   id_found = @atome[:id]
#   DOM do
#     canvas({ id: id_found }).atome
#   end.append_to(BrowserHelper.browser_document[:user_view])
#   @browser_object = BrowserHelper.browser_document[id_found]
# end
#
# new({ browser: :shape }) do
#   @browser_type = :div
#   id_found = @atome[:id]
#   DOM do
#     div(id: id_found).atome
#   end.append_to(BrowserHelper.browser_document[:user_view])
#   @browser_object = BrowserHelper.browser_document[id_found]
# end

def experiments(parent, image)

  `

var img = new Image();
img.src = #{image};
img.onload = function() {
    var fab_canvas = new fabric.Canvas(#{parent});
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
            o.scaleToHeight(100)
        o.scaleToWidth(100)
o.filters.push(new fabric.Image.filters.BlendColor({color: 'blue'}));
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

o.filters.push(new fabric.Image.filters.BlendColor({color: 'green'}));
o.applyFilters();
          }
      })

}, 2000)

`
end

def experiment(parent, image)

  `

const canvas = new fabric.Canvas("view", {
 width:500,
 height:500,
 //backgroundColor:"White"
});

fabric.Image.fromURL(#{image},(img) => {
 // the scaleToHeight property is use to set the image height
    img.scaleToHeight(150)
 // scaleToWidth is use to set the image width
    img.scaleToWidth(150)
    canvas.add(img)
})
canvas.renderAll()




`
end

# back=box({left: 333})
#
# i=back.image({ path: "./medias/images/moto.png", top: 93, id: :toto })
# i.left(333)
# i.width(133)
# i.shadow({ blur: 33 })

# experiment(:toto, "./medias/images/moto.png")

# imagea = i.browser_object
#
# # alert imagea
#
# is_grayscale = false
#
# # imagea.add_event_listener("click") do
# #   is_grayscale = !is_grayscale
# #   if is_grayscale
# #     imagea.style.filter = "grayscale(100%)"
# #     imagea.style.filter = "blur(5px)"
# imagea.style.filter = "grayscale(100%) blur(5px)"
#
# i.drag(true)
#
# b=box({left: 0, color: :red, id: :colorizer})
#
# bb=b.browser_object
# b.left(280)
# bb.style.mixBlendMode = "multiply"
#
#
# `
# const foregroundImage = document.querySelector("#colorizer");
# // Ajout de l'effet de composition
# foregroundImage.style.mixBlendMode = "multiply";
# // Ajout de l'image de premier plan à l'élément parent (image de fond)
# `

################### colorisation works #############
# def cimage(params)
#   unless params.instance_of? Hash
#     params={path:  "./medias/images/#{params}"}
#   end
#   path= {path: params.delete(:path) }
#   im=image(path)
#   back=box({color: {alpha: 0}})
#   back.attached(im.id)
#   im.set({width: '100%', left: 0, height: '100%', top: 0, id: "#{back.id}_img"})
#   color=box({id: "#{back.id}_col"})
#   back.attached(color.id)
#   color.set({width: '100%', left: 0, height: '100%', top: 0})
#   back
# end
#
# class Atome
#   def ccolor(params)
#     colorizer_id="#{self.id}_col"
#     colorizer_img_id="#{self.id}_img"
#     colorized_image=grab(colorizer_img_id).browser_object
#     colorized_image.style.filter = "grayscale(100%)"
#     grab(colorizer_id).color(params)
#
#     `
# const foregroundImage = document.querySelector("#"+#{colorizer_id});
# foregroundImage.style.mixBlendMode = "multiply";
# `
#   end
# end
#
#
# ci=cimage( "moto.png" )
# ci.left(100)
# ci.ccolor(:blue)

class Atome

  def cimage(params = nil, parent_found = :view)
    back = grab(parent_found.value).box()
    back.set({ width: '100%', left: 0, height: '100%', top: 0 })
    # grab(parent_found.value).attached(back.id.value)
    back.browser_object
    back.box({ width: '100%', left: 0, height: '100%', top: 0, color: { alpha: 0 } })
    created_url = "'./medias/images/#{params}'"
    created_path = "url(#{created_url})"

    `
let maskedDiv = document.getElementById(#{back.id});
  maskedDiv.style.backgroundImage = #{created_path};
  maskedDiv.style.maskImage = #{created_path};
  maskedDiv.style.backgroundSize = 'fit';
 maskedDiv.style.backgroundPosition = 'center';
 maskedDiv.style.backgroundRepeat = 'no-repeat';
maskedDiv.style.maskMode = 'alpha';
 maskedDiv.style.maskRepeat = 'no-repeat';
maskedDiv.style.maskSize = '100%';
 maskedDiv.style.maskPosition = 'center';

colorizer=maskedDiv.firstElementChild
`

    back
  end

  def colorize(params, mode = :multiply)
    `
    let maskedDiv = document.getElementById(#{self.id});
//maskedDiv.style.filter = "grayscale(100%)"
colorizer=maskedDiv.firstElementChild;
colorizer.style.backgroundColor = #{params};
colorizer.style.mixBlendMode = #{mode};

`
  end
end

######### Website ##########
require 'application/home'




def style
  base_size = 50
  header = 90
  footer = 50
  icon_size= 19
  {
    titles: :orange,
    infos: { width: '90%', height: '90%', left: 3, top: 3, visual: {size: 15}, center: true},
    title: { center: :horizontal, top: :auto, bottom: 3, id: :title, data: :title, color: { red: 0.5, green: 0.5, blue: 0.5 }, visual: { size: 19 } },
    base_size: base_size,
    web_shadow: { blur: 16, left: 3, top: 3, id: :web_shadow },
    header: { id: :header, left: 0, right: 0, height: header, top: 0, bottom: :auto, width: :auto, overflow: :visible,
              color: { red: 0.15, green: 0.15, blue: 0.15 } },
    footer: { id: :footer, left: 0, right: 0, height: footer, bottom: 0, top: :auto, width: :auto,
              color: { red: 0.1, green: 0.1, blue: 0.1 } },
    logo: { id: :logo, height: 39,  path: './medias/images/c1i_logo.svg',  width: '9%',top: 19, left: 19 },
    c1i: { id: :c1i, bottom: base_size, left: 0, right: 0, height: :auto, path: './medias/images/c1i_text.svg', width: '39%', center: :horizontal, top: 20 },
    content: { id: :content, top: header, bottom: footer, left: 0, right: 0, width: :auto, height: :auto,overflow: :auto,
               color: { red: 0.15, green: 0.15, blue: 0.15 }
    },
    rubriques: { id: :rubriques, left: 0, width: 300, height: 300, parents: [:content], columns: { count: 2 },
                 rows: { count: 2 }, color: { red: 0.15, green: 0.15, blue: 0.15 },
                 cells: { particles: { margin: 15, color: { red: 0.15, green: 0.15, blue: 0.15 },
                                       smooth: 0, shadow: { blur: 16, left: 3, top: 3 } } } },
    mail: { center: :vertical, top: :auto, bottom: 0, width: icon_size, height: icon_size, left: 10, id: :mail, path: './medias/images/icons/mail_orange.svg' },
    facebook: { center: :vertical, top: :auto, bottom: 0, width: icon_size, height: icon_size, left: 60, id: :facebook, path: './medias/images/logos/orange/Facebook.svg' },
    instagram: { center: :vertical, top: :auto, bottom: 0, width: icon_size, height: icon_size, left: 110, id: :instagram, path: './medias/images/logos/orange/instagram.svg' },
    vimeo: { center: :vertical, top: :auto, bottom: 0, width: icon_size, height: icon_size, left: 160, id: :vimeo, path: './medias/images/logos/orange/vimeo.svg' },
    section:{
      width: '100%', height: '100%' , visual: {size: 15}
    },
    label_color: {id: :label_color, red: 0.7, green: 0.7, blue: 0.7},
    text_color:{id: :text_color, red: 0.7, green: 0.7, blue: 0.7} ,
    text: {visual: { size: 14 }}
  }

end
# shadow (style[:web_shadow])
box(style[:content]) # content
box(style[:header])
box(style[:footer])

text(style[:title])
# C1I
image(style[:logo])
# logo
image(style[:c1i])
# footer
image(style[:mail])
image(style[:facebook])
image(style[:instagram])
image(style[:vimeo])

grab(:title).touch(true) do
  home
end

grab(:mail).touch(true) do
  `
    var recipient = "contact@c1i.eu";
    var subject = "Demande de renseignement";
    var body = "Contenu de l'e-mail";
    window.location.href = "mailto:" + recipient + "?subject=" + subject + "&body=" + body;
`
end
grab(:facebook).touch(true) do
  alert :facebookingthezuckerdequeu
end
grab(:instagram).touch(true) do
  alert :instagrumgrum

end
grab(:vimeo).touch(true) do
  alert :vimeoingthebelette
end

 matrix(style[:rubriques])

# section.fusion(rows: { 2 => [0, 1] })

color(style[:label_color])
color(style[:text_color])
# alert(grab(:label_color))

# grab(:center).attached([:rubriques])
grab(:header).attached([:logo, :c1i, :title])
grab(:footer).attached([:mail, :facebook, :instagram, :vimeo])


def title(text)
  grab(:title).data(text)
end

def infos(txt)
  # alert (grab(:rubriques).cell(4))
  # grab(:rubriques).cell(4).text(style[:infos].merge({ data: txt }))
  # grab(:rubriques_4).text(style[:infos].merge({ data: txt }))
end

def clear_page
  sections = grab(:rubriques)
  sections.cell(0).unbind(:tap)
  sections.cell(1).unbind(:tap)
  sections.cell(2).unbind(:tap)
  sections.cell(3).unbind(:tap)
  # sections.cell(4).unbind(:tap)
  sections.cell(0).materials.each do |child|
    unless child.to_s == :rubriques
      grab(child).delete(true) if grab(child)
    end
  end
  sections.cell(1).materials.each do |child|
    unless child.to_s == :rubriques
      grab(child).delete(true) if grab(child)
    end
  end
  sections.cell(2).materials.each do |child|
    unless child.to_s == :rubriques
      grab(child).delete(true) if grab(child)
    end
  end
  sections.cell(3).materials.each do |child|
    unless child.to_s == :rubriques
      grab(child).delete(true) if grab(child)
    end
  end
  # sections.cell(4).materials.each do |child|
  #   unless child.to_s == :rubriques
  #     grab(child).delete(true) if grab(child)
  #   end
  # end
end

# def fill_image(im1 = 'drone.jpg', im2 = 'drone.jpg', im3 = 'drone.jpg', im4 = 'drone.jpg', im5 = 'drone.jpg')
#   sections = grab(:rubriques)
#   ima_1 = grab(:view).cimage(im1, sections.cell(0).id)
#   ima_2 = grab(:view).cimage(im2, sections.cell(1).id)
#   ima_3 = grab(:view).cimage(im3, sections.cell(2).id)
#   ima_4 = grab(:view).cimage(im4, sections.cell(3).id)
#   ima_5 = grab(:view).cimage(im5, sections.cell(4).id)
#
#   ima_1.colorize(:green, :color)
#   ima_2.colorize(:green, :color)
#   ima_3.colorize(:green, :color)
#   ima_4.colorize(:green, :color)
#   ima_5.colorize(:green, :color)
# end

def fill_image(im1 = nil, im2 = nil, im3 = nil, im4 = nil, _im5 = nil)
  sections = grab(:rubriques)
  sections.cell(0).image({ path: "./medias/images/#{im1}.jpg", width: '100%', height: '100%' }) if im1
  sections.cell(1).image({ path: "./medias/images/#{im2}.jpg", width: '100%', height: '100%' }) if im2
  sections.cell(2).image({ path: "./medias/images/#{im3}.jpg", width: '100%', height: '100%' }) if im3
  sections.cell(3).image({ path: "./medias/images/#{im4}.jpg", width: '100%', height: '100%' }) if im4
  # sections.cell(4).image({ path: "./medias/images/#{im5}.jpg", width: '100%', height: '100%' }) if im5
end

def fill_title(t1 = nil, t2 = nil, t3 = nil, t4 = nil, _t5 = nil)
  sections = grab(:rubriques)
  # sections.cell(0).text({ data: t1, width: '100%', height: '100%', visual: {size: 15}, attached: :label_color }) if t1
  # sections.cell(1).text({ data: t2, width: '100%', height: '100%', visual: {size: 15}, attached: :label_color   }) if t2
  # sections.cell(2).text({ data: t3, width: '100%', height: '100%' , visual: {size: 15}, attached: :label_color  }) if t3
  # sections.cell(3).text({ data: t4, width: '100%', height: '100%' , visual: {size: 15}, attached: :label_color  }) if t4
  # sections.cell(4).text({ path: "./medias/images/#{im5}.jpg", width: '100%', height: '100%' }) if t5
end


def fill_text(t1 = nil, t2 = nil, t3 = nil, t4 = nil, _t5 = nil)
  sections = grab(:rubriques)
  sections.cell(0).text({ data: t1, width: '100%', height: '100%', visual: {size: 12}, attached: :text_color }, center: true) if t1
  sections.cell(1).text({ data: t2, width: '100%', height: '100%', visual: {size: 12} , attached: :text_color, center: true  }) if t2
  sections.cell(2).text({ data: t3, width: '89%', height: '100%' , visual: {size: 12}, attached: :text_color , center: true }) if t3
  sections.cell(3).text({ data: t4, width: '100%', height: '100%' , visual: {size: 12},attached: :text_color, center: true  }) if t4
  # sections.cell(4).text({ path: "./medias/images/#{im5}.jpg", width: '100%', height: '100%' }) if t5
end


def fill_color(c1 = nil, c2 = nil, c3 = nil, c4 = nil, _c5 = nil)
  sections = grab(:rubriques)
  sections.cell(0).color(c1) if c1
  sections.cell(1).color(c2) if c2
  sections.cell(2).color(c3) if c3
  sections.cell(3).color(c4) if c4
  # sections.cell(4).text({ path: "./medias/images/#{im5}.jpg", width: '100%', height: '100%' }) if t5
end

def fill_web(im1 = nil, im2 = nil, im3 = nil, im4 = nil, _im5 = nil)
  sections = grab(:rubriques)
  sections.cell(0).web({ path: "https://www.youtube.com/embed/#{im1}", width: '100%', height: '100%' }) if im1
  sections.cell(1).web({ path: "https://www.youtube.com/embed/#{im2}", width: '100%', height: '100%' }) if im2
  sections.cell(2).web({ path: "https://www.youtube.com/embed/#{im3}", width: '100%', height: '100%' }) if im3
  sections.cell(3).web({ path: "https://www.youtube.com/embed/#{im4}", width: '100%', height: '100%' }) if im4
  # sections.cell(4).web({ path: "https://www.youtube.com/embed/#{im5}", width: '100%', height: '100%' }) if im5
end

def fill_video(im1 = nil, im2 = nil, im3 = nil, im4 = nil, _im5 = nil)
  sections = grab(:rubriques)
  sections.cell(0).video({ path: "./medias/videos/#{im1}.mp4", width: '100%', height: '100%' }) if im1
  sections.cell(1).image({ path: "./medias/videos/#{im2}.mp4", width: '100%', height: '100%' }) if im2
  sections.cell(2).image({ path: "./medias/videos/#{im3}.mp4", width: '100%', height: '100%' }) if im3
  sections.cell(3).image({ path: "./medias/videos/#{im4}.mp4", width: '100%', height: '100%' }) if im4
  # sections.cell(4).image({ path: "./medias/videos/#{im5}.mp4", width: '100%', height: '100%' }) if im5
end

def section_links(link1 = :page1, link2 = :page, link3 = :page3, link4 = :page4, link5 = :infos)
  grab(:rubriques).cell(0).touch(true) do
    send(link1)
  end
  grab(:rubriques).cell(1).touch(true) do
    send(link2)
  end
  grab(:rubriques).cell(2).touch(true) do
    send(link3)
  end
  grab(:rubriques).cell(3).touch(true) do
    send(link4)
  end

  # grab(:rubriques).cell(4).touch(true) do
  #   send(link5)
  # end
end


def reset_size
  section=grab(:rubriques)
  matrix_ratio = section.height.value / section.width.value
  section.resize($window.view.width, $window.view.width * matrix_ratio)
end
$window.on :resize do
  reset_size
  # section.cell(4).height(section.cell(4).height.value / 2)
end


# section.cell(4).height(section.cell(4).height.value / 2)
# reset_size
#init the site:
home

# FIXME : ultra important ===> theres a big confusion with children and parents
# b=box({id: :content})
# m=matrix(style[:rubriques])
#
# m.cell(0).materials.each do |child|
#   alert child
# end

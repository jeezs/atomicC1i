Opal.queue(function(Opal) {/* Generated by Opal 1.7.1 */
  var $hash2 = Opal.hash2, $rb_divide = Opal.rb_divide, $def = Opal.def, $send = Opal.send, $hash = Opal.hash, $truthy = Opal.truthy, $gvars = Opal.gvars, $rb_times = Opal.rb_times, $return_val = Opal.return_val, $klass = Opal.klass, self = Opal.top, $nesting = [], $$ = Opal.$r($nesting), nil = Opal.nil, deco_color = nil, deco_color2 = nil, rubriques = nil, mail = nil, facebook = nil, instagram = nil, youtube = nil, vimeo = nil, tiktok = nil, twitter = nil, matrix_ratio = nil, generator = nil;
  if (self.header == null) self.header = nil;
  if (self.footer == null) self.footer = nil;
  if (self.logo == null) self.logo = nil;
  if ($gvars.window == null) $gvars.window = nil;

  Opal.add_stubs('/,box,[],style,image,color,id,text,merge,matrix,cell,grab,touch,cell_5,home,fusion,each,children,delete,clear_cell,cell_1,cell_2,cell_3,cell_4,unbind,unbind_all,send,relink,imagize,labelize,data,alert,colorize,value,height,width,on,resize,view,*,over,attached,generator,build_particle,build_render,drop_proc=,atome,atome_js,is_a?,instance_exec,to_proc');
  
  
  $def(self, '$style', function $$style() {
    var base_size = nil;

    
    base_size = 50;
    return $hash2(["titles", "title", "main_titles", "base_size", "web_shadow", "header", "footer", "logo", "content", "c1i", "rubriques"], {"titles": "orange", "title": $hash2(["center", "top", "id"], {"center": "horizontal", "top": base_size, "id": "title"}), "main_titles": $hash2(["red", "green", "blue"], {"red": 0.2, "green": 0.2, "blue": 0.2}), "base_size": base_size, "web_shadow": $hash2(["blur", "left", "top"], {"blur": 16, "left": 3, "top": 3}), "header": $hash2(["id", "left", "right", "height", "top", "bottom", "width", "overflow", "color"], {"id": "header", "left": 0, "right": 0, "height": base_size, "top": 0, "bottom": "auto", "width": "auto", "overflow": "visible", "color": $hash2(["red", "green", "blue"], {"red": 0.15, "green": 0.15, "blue": 0.15})}), "footer": $hash2(["id", "left", "right", "height", "bottom", "top", "width", "color"], {"id": "footer", "left": 0, "right": 0, "height": base_size, "bottom": 0, "top": "auto", "width": "auto", "color": $hash2(["red", "green", "blue"], {"red": 0.15, "green": 0.15, "blue": 0.15})}), "logo": $hash2(["id", "height", "top", "left"], {"id": "logo", "height": 39, "top": 33, "left": 30}), "content": $hash2(["id", "top", "bottom", "left", "right", "width", "height"], {"id": "content", "top": base_size, "bottom": $rb_divide(base_size, 2), "left": 0, "right": 0, "width": "auto", "height": "auto"}), "c1i": $hash2(["id", "top", "bottom", "left", "right", "width", "height"], {"id": "c1i", "top": base_size, "bottom": base_size, "left": 0, "right": 0, "width": "auto", "height": "auto"}), "rubriques": $hash2(["id", "left", "width", "height", "parents", "columns", "rows", "color", "cells"], {"id": "rubriques", "left": 0, "width": 300, "height": 450, "parents": ["content"], "columns": $hash2(["count"], {"count": 2}), "rows": $hash2(["count"], {"count": 3}), "color": $hash2(["red", "green", "blue"], {"red": 0.15, "green": 0.15, "blue": 0.15}), "cells": $hash2(["particles"], {"particles": $hash2(["margin", "color", "smooth", "shadow"], {"margin": 15, "color": $hash2(["red", "green", "blue"], {"red": 0.15, "green": 0.15, "blue": 0.15}), "smooth": 0, "shadow": $hash2(["blur", "left", "top"], {"blur": 16, "left": 3, "top": 3})})})})});
  });
  self.content = self.$box($hash2(["id", "top", "bottom", "width", "height", "left", "right", "color", "overflow"], {"id": self.$style()['$[]']("content")['$[]']("id"), "top": self.$style()['$[]']("content")['$[]']("top"), "bottom": self.$style()['$[]']("content")['$[]']("bottom"), "width": self.$style()['$[]']("content")['$[]']("width"), "height": self.$style()['$[]']("content")['$[]']("height"), "left": self.$style()['$[]']("content")['$[]']("left"), "right": self.$style()['$[]']("content")['$[]']("right"), "color": $hash2(["red", "green", "blue"], {"red": 0.15, "green": 0.15, "blue": 0.15}), "overflow": "auto"}));
  self.header = self.$box($hash2(["id", "left", "right", "top", "bottom", "height", "color", "width"], {"id": self.$style()['$[]']("header")['$[]']("id"), "left": self.$style()['$[]']("header")['$[]']("left"), "right": self.$style()['$[]']("header")['$[]']("right"), "top": self.$style()['$[]']("header")['$[]']("top"), "bottom": self.$style()['$[]']("header")['$[]']("bottom"), "height": self.$style()['$[]']("header")['$[]']("height"), "color": self.$style()['$[]']("header")['$[]']("color"), "width": self.$style()['$[]']("header")['$[]']("width")}));
  self.footer = self.$box($hash2(["id", "left", "right", "bottom", "top", "height", "color", "width"], {"id": self.$style()['$[]']("footer")['$[]']("id"), "left": self.$style()['$[]']("footer")['$[]']("left"), "right": self.$style()['$[]']("footer")['$[]']("right"), "bottom": self.$style()['$[]']("footer")['$[]']("bottom"), "top": self.$style()['$[]']("footer")['$[]']("top"), "height": self.$style()['$[]']("footer")['$[]']("height"), "color": self.$style()['$[]']("footer")['$[]']("color"), "width": self.$style()['$[]']("footer")['$[]']("width")}));
  self.c1 = self.header.$image($hash2(["path", "id", "size", "center"], {"path": "./medias/images/c1i_text.svg", "id": self.$style()['$[]']("c1i")['$[]']("id"), "size": "39%", "center": true}));
  self.logo = self.header.$image($hash2(["path", "id", "height", "center", "width", "left", "top"], {"path": "./medias/images/c1i_logo.svg", "id": self.$style()['$[]']("logo")['$[]']("id"), "height": self.$style()['$[]']("logo")['$[]']("height"), "center": "vertical", "width": "9%", "left": self.$style()['$[]']("logo")['$[]']("left"), "top": self.$style()['$[]']("logo")['$[]']("top")}));
  deco_color = self.$color($hash2(["red", "green", "blue"], {"red": $rb_divide(34, 255), "green": $rb_divide(255, 255), "blue": $rb_divide(29, 255)}));
  deco_color2 = self.$color("orange");
  self.header.$box($hash2(["attached", "left", "right", "height", "top", "width"], {"attached": [deco_color.$id()], "left": "auto", "right": 0, "height": 1, "top": $rb_divide(self.$style()['$[]']("base_size"), 2), "width": "27%"}));
  self.footer.$box($hash2(["attached", "left", "right", "height", "top", "width"], {"attached": [deco_color2.$id()], "left": "auto", "right": 0, "height": 1, "top": 12, "width": "100%"}));
  self.header.$text($hash2(["data"], {"data": "bienvenue"}).$merge(self.$style()['$[]']("title")));
  rubriques = self.$matrix(self.$style()['$[]']("rubriques"));
  
  $def(self, '$cell_1', function $$cell_1() {
    var self = this;

    return self.$grab("rubriques").$cell(0)
  });
  
  $def(self, '$cell_2', function $$cell_2() {
    var self = this;

    return self.$grab("rubriques").$cell(1)
  });
  
  $def(self, '$cell_3', function $$cell_3() {
    var self = this;

    return self.$grab("rubriques").$cell(2)
  });
  
  $def(self, '$cell_4', function $$cell_4() {
    var self = this;

    return self.$grab("rubriques").$cell(3)
  });
  
  $def(self, '$cell_5', function $$cell_5() {
    var self = this;

    return self.$grab("rubriques").$cell(4)
  });
  $send(self.$cell_5(), 'touch', ["down"], function $$1(){var self = $$1.$$s == null ? this : $$1.$$s;

    return self.$home()}, {$$s: self});
  $send(self.logo, 'touch', ["down"], function $$2(){var self = $$2.$$s == null ? this : $$2.$$s;

    return self.$home()}, {$$s: self});
  $send(self.$grab("title"), 'touch', ["down"], function $$3(){var self = $$3.$$s == null ? this : $$3.$$s;

    return self.$home()}, {$$s: self});
  rubriques.$fusion($hash2(["rows"], {"rows": $hash(2, [0, 1])}));
  
  $def(self, '$clear_cell', function $$clear_cell(cell) {
    var self = this;

    
    $send(cell.$children(), 'each', [], function $$4(child_id){var self = $$4.$$s == null ? this : $$4.$$s, child_found = nil;

      
      if (child_id == null) child_id = nil;
      child_found = self.$grab(child_id);
      if ($truthy(child_found)) {
        return child_found.$delete(true)
      } else {
        return nil
      };}, {$$s: self});
    return cell.$children([]);
  });
  
  $def(self, '$unbind_all', function $$unbind_all() {
    var self = this;

    
    self.$clear_cell(self.$cell_1());
    self.$clear_cell(self.$cell_2());
    self.$clear_cell(self.$cell_3());
    self.$clear_cell(self.$cell_4());
    self.$cell_1().$unbind("tap");
    self.$cell_2().$unbind("tap");
    self.$cell_3().$unbind("tap");
    return self.$cell_4().$unbind("tap");
  });
  
  $def(self, '$relink', function $$relink(link1, link2, link3, link4) {
    var self = this;

    
    self.$unbind_all();
    $send(self.$cell_1(), 'touch', ["down"], function $$5(){var self = $$5.$$s == null ? this : $$5.$$s;

      
      self.$unbind_all();
      return self.$send(link1, self.$cell_1(), self.$cell_2(), self.$cell_3(), self.$cell_4());}, {$$s: self});
    $send(self.$cell_2(), 'touch', ["down"], function $$6(){var self = $$6.$$s == null ? this : $$6.$$s;

      return self.$send(link2, self.$cell_1(), self.$cell_2(), self.$cell_3(), self.$cell_4())}, {$$s: self});
    $send(self.$cell_3(), 'touch', ["down"], function $$7(){var self = $$7.$$s == null ? this : $$7.$$s;

      return self.$send(link3, self.$cell_1(), self.$cell_2(), self.$cell_3(), self.$cell_4())}, {$$s: self});
    return $send(self.$cell_4(), 'touch', ["down"], function $$8(){var self = $$8.$$s == null ? this : $$8.$$s;

      return self.$send(link4, self.$cell_1(), self.$cell_2(), self.$cell_3(), self.$cell_4())}, {$$s: self});
  });
  
  $def(self, '$labelize', function $$labelize(item1, item2, item3, item4) {
    var self = this;

    
    self.$cell_1().$text($hash2(["data"], {"data": item1}));
    self.$cell_2().$text($hash2(["data"], {"data": item2}));
    self.$cell_3().$text($hash2(["data"], {"data": item3}));
    return self.$cell_4().$text($hash2(["data"], {"data": item4}));
  });
  
  $def(self, '$imagize', function $$imagize(item1, item2, item3, item4) {
    var self = this;

    
    self.$cell_1().$image($hash2(["path", "size", "left", "top"], {"path": "./medias/images/" + (item1) + ".jpg", "size": "100% ", "left": 0, "top": 0}));
    self.$cell_2().$image($hash2(["path", "size", "left", "top"], {"path": "./medias/images/" + (item2) + ".jpg", "size": "100% ", "left": 0, "top": 0}));
    self.$cell_3().$image($hash2(["path", "size", "left", "top"], {"path": "./medias/images/" + (item3) + ".jpg", "size": "100% ", "left": 0, "top": 0}));
    return self.$cell_4().$image($hash2(["path", "size", "left", "top"], {"path": "./medias/images/" + (item4) + ".jpg", "size": "100% ", "left": 0, "top": 0}));
  });
  
  $def(self, '$colorize', function $$colorize(color) {
    var self = this;

    
    self.$cell_1().$color(color);
    self.$cell_2().$color(color);
    self.$cell_3().$color(color);
    return self.$cell_4().$color(color);
  });
  
  $def(self, '$home', function $$home() {
    var self = this;

    
    self.$relink("realisations", "captation", "diffusion", "competence");
    self.$imagize("Video_Prod1", "Video_Prod2", "Video_Prod4", "Video_Prod5");
    self.$labelize("realisations", "captation", "diffusion", "competence");
    return self.$grab("title").$data("Bienvenue");
  });
  
  $def(self, '$realisations', function $$realisations() {
    var self = this;

    
    self.$grab("title").$data("réalisations");
    self.$imagize("Concert", "Court", "Studio", "reali_1");
    self.$labelize("documentaire", "court", "institutionel", "videoclips");
    return $send(self.$cell_1(), 'touch', ["down"], function $$9(){var self = $$9.$$s == null ? this : $$9.$$s;

      return self.$alert("realisations cell1")}, {$$s: self});
  });
  
  $def(self, '$captation', function $$captation() {
    var self = this;

    
    self.$grab("title").$data("Captations");
    self.$imagize("Plateau", "roue", "Concert", "dance");
    self.$labelize("Evénementiel", "Time-Lapse", "Concerts", "Spectacles");
    return $send(self.$cell_1(), 'touch', ["down"], function $$10(){var self = $$10.$$s == null ? this : $$10.$$s;

      return self.$alert("captation cell1")}, {$$s: self});
  });
  
  $def(self, '$diffusion', function $$diffusion() {
    var self = this;

    
    self.$grab("title").$data("Diffusion");
    self.$imagize("Socialpasnet", "Website", "Application", "interactive");
    self.$labelize("Réseaux Sociaux", "Création Site Web", "Création Applications", "Vidéos interactive");
    return self.$colorize("yellow");
  });
  
  $def(self, '$competence', function $$competence() {
    var self = this;

    
    self.$grab("title").$data("Compétence");
    self.$imagize("Drone", "Plateau", "AR2", "3D");
    return self.$labelize("Drone", "Multi-cams", "VR-AR", "3D");
  });
  self.$home();
  mail = self.footer.$image($hash2(["path", "size", "left", "bottom"], {"path": "./medias/images/icons/mail_orange.svg", "size": 25, "left": 16, "bottom": 8}));
  facebook = self.footer.$image($hash2(["path", "size", "right", "bottom"], {"path": "./medias/images/logos/orange/Facebook.svg", "size": 25, "right": 16, "bottom": 8}));
  instagram = self.footer.$image($hash2(["path", "size", "right", "bottom"], {"path": "./medias/images/logos/orange/instagram.svg", "size": 25, "right": 56, "bottom": 8}));
  youtube = self.footer.$image($hash2(["path", "size", "right", "bottom"], {"path": "./medias/images/logos/orange/youtube.svg", "size": 33, "right": 95, "bottom": 4}));
  vimeo = self.footer.$image($hash2(["path", "size", "right", "bottom"], {"path": "./medias/images/logos/orange/vimeo.svg", "size": 25, "right": 138, "bottom": 8}));
  tiktok = self.footer.$image($hash2(["path", "size", "right", "bottom"], {"path": "./medias/images/logos/orange/TikTok.svg", "size": 25, "right": 170, "bottom": 8}));
  twitter = self.footer.$image($hash2(["path", "size", "right", "bottom"], {"path": "./medias/images/logos/orange/Twitter.svg", "size": 25, "right": 200, "bottom": 8}));
  $send(mail, 'touch', ["down"], function $$11(){
    
    var recipient = "contact@c1i.eu";
    var subject = "Demande de renseignement";
    var body = "Contenu de l'e-mail";
    window.location.href = "mailto:" + recipient + "?subject=" + subject + "&body=" + body;
});
  $send(facebook, 'touch', ["down"], function $$12(){var self = $$12.$$s == null ? this : $$12.$$s;

    return self.$alert("facebookingthezuckerdebite")}, {$$s: self});
  $send(youtube, 'touch', ["down"], function $$13(){var self = $$13.$$s == null ? this : $$13.$$s;

    return self.$alert("youtubeingthegogol")}, {$$s: self});
  $send(instagram, 'touch', ["down"], function $$14(){var self = $$14.$$s == null ? this : $$14.$$s;

    return self.$alert("instagramingthenoobs")}, {$$s: self});
  $send(vimeo, 'touch', ["down"], function $$15(){var self = $$15.$$s == null ? this : $$15.$$s;

    return self.$alert("vimeoingthebelette")}, {$$s: self});
  $send(tiktok, 'touch', ["down"], function $$16(){var self = $$16.$$s == null ? this : $$16.$$s;

    return self.$alert("tiktokingthechintok")}, {$$s: self});
  $send(twitter, 'touch', ["down"], function $$17(){var self = $$17.$$s == null ? this : $$17.$$s;

    return self.$alert("twitteringthemusk")}, {$$s: self});
  matrix_ratio = $rb_divide(rubriques.$height().$value(), rubriques.$width().$value());
  $send($gvars.window, 'on', ["resize"], function $$18(){    if ($gvars.window == null) $gvars.window = nil;

    
    rubriques.$resize($gvars.window.$view().$width(), $rb_times($gvars.window.$view().$width(), matrix_ratio));
    return rubriques.$cell(4).$height($rb_divide(rubriques.$cell(4).$height().$value(), 2));});
  rubriques.$resize($gvars.window.$view().$width(), $rb_times($gvars.window.$view().$width(), matrix_ratio));
  rubriques.$cell(4).$height($rb_divide(rubriques.$cell(4).$height().$value(), 2));
  
  $def(self, '$experiments', function $$experiments() {
    var self = this, b = nil, red = nil, blue = nil;

    
    const Fabric_canvas={};
    

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

var getted_canvas = Fabric_canvas.myCanvasId
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

;
    b = self.$box($hash2(["id"], {"id": "tuti"}));
    red = self.$color("red");
    blue = self.$color("blue");
    $send(b, 'over', ["enter"], function $$19(){var self = $$19.$$s == null ? this : $$19.$$s;

      return self.$attached([red.$id()])}, {$$s: self});
    $send(b, 'over', ["leave"], function $$20(){var self = $$20.$$s == null ? this : $$20.$$s;

      return self.$attached([blue.$id()])}, {$$s: self});
    $send(b, 'touch', [true], $return_val(nil));
    
const atomeDrop = {

    drop: function (options, atome_id, atome) {
        let element = document.getElementById(atome_id)
        const position = {x: 0, y: 0}
        interact(element).draggable({
            listeners: {
                start(event) {
                    atome.$drag_start_callback(event.pageX, event.pageY, event.rect.left, event.rect.top);
                },
                move(event) {
                    position.x += event.dx
                    position.y += event.dy
                    //  we feed the callback method below
                    atome.$drag_move_callback(event.pageX, event.pageY, event.rect.left, event.rect.top);

                    if (options === true) {
                        event.target.style.transform =
                            event.target.style.transform = 'translate(' + position.x + 'px, ' + position.y + 'px)'
                    }

                },
                end(event) {
                    atome.$drag_end_callback(event.pageX, event.pageY, event.rect.left, event.rect.top);


                },
            }
        })

    },

    inertia: function (options, atome_id, _atome) {
        let element = document.getElementById(atome_id)
        interact(element).draggable({
            inertia: options
        })
    },

    lock: function (options, atome_id, _atome) {
        let element = document.getElementById(atome_id)
        interact(element).draggable({
            startAxis: 'xy',
            lockAxis: options
        });
    },

    remove: function (options, atome_id, _atome) {
        let element = document.getElementById(atome_id)
        interact(element).draggable(options);
    },

    snap: function (options, atome_id, _atome) {
        let element = document.getElementById(atome_id)
        interact(element)
            .draggable({
                modifiers: [
                    interact.modifiers.snap({
                        targets: [
                            interact.snappers.grid(options),
                        ],
                        range: Infinity,
                        relativePoints: [{x: 0, y: 0}]
                    }),
                ],
            })
    },

    constraint: function (params, atome_id, _atome) {
        let element = document.getElementById(atome_id)
        if ((typeof params) != 'object' && params !== 'parent') {
            params = document.getElementById(params);
        }
        interact(element)
            .draggable({
                modifiers: [
                    interact.modifiers.restrict({
                        restriction: params,
                        elementRect: {top: 0, left: 0, bottom: 1, right: 1},
                        // endOnly: false
                    })
                ],
            })
    }
}

;
  });
  generator = $$('Genesis').$generator();
  generator.$build_particle("drop");
  $send(generator, 'build_render', ["browser_drop"], function $$21(options, proc){var self = $$21.$$s == null ? this : $$21.$$s;

    
    if (options == null) options = nil;
    if (proc == null) proc = nil;
    return $send(options, 'each', [], function $$22(method, params){var self = $$22.$$s == null ? this : $$22.$$s, atome_id = nil;
      if (self.atome == null) self.atome = nil;

      
      if (method == null) method = nil;
      if (params == null) params = nil;
      atome_id = self.atome['$[]']("id");
      self.$atome()['$drop_proc='](proc);
      return self.$atome_js().drop(params, atome_id, self);}, {$$s: self});}, {$$s: self});
  return (function($base, $super, $parent_nesting) {
    var self = $klass($base, $super, 'Atome');

    var $nesting = [self].concat($parent_nesting), $$ = Opal.$r($nesting), $proto = self.$$prototype;

    $proto.drag_move_proc = nil;
    return $def(self, '$drop_callback', function $$drop_callback(page_x, page_y, left_val, top_val) {
      var self = this, proc = nil;

      
      proc = self.drag_move_proc;
      if ($truthy(proc['$is_a?']($$('Proc')))) {
        return $send(self, 'instance_exec', [$hash2(["pageX", "pageY", "left", "top"], {"pageX": page_x, "pageY": page_y, "left": left_val, "top": top_val})], proc.$to_proc())
      } else {
        return nil
      };
    })
  })($nesting[0], null, $nesting);
});

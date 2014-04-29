window.Publicaciones = {};

Publicaciones.Views = {};
Publicaciones.Collections = {};
Publicaciones.Models = {};
Publicaciones.Routers = {};

window.routers = {};
window.models = {};
window.views = {};
window.collections = {};


Publicaciones.Models.Publicacion = Backbone.Model.extend({
    defaults: {
      titulo: '',
      is_active: true,
      position: 0,
    }
});

Publicaciones.Collections.Publicaciones = Backbone.Collection.extend({
    model: Publicaciones.Models.Publicacion,
});

//esta vista recibe un modelo PublicacionModel para que pueda renderear su contenido
Publicaciones.Views.Item = Backbone.View.extend({
    tagName: "tr",
    template: swig.compile($("#item_table_template").html()),
    className: 'registro-sorteable',
    events: {
      "click .acciones .boton-up" : "upPublicacion",
      "click .acciones .boton-down" : "downPublicacion",  
    },
    initialize: function() {
        this.model.on("change", this.render, this);
        this.id = "registro-" + this.model.get("id");
    },
    render: function() {
        var data = this.model.toJSON();
        this.$el.html(this.template(data)).attr({id: 'registro-'+this.model.get('id')});
        return this;
    },
    upPublicacion: function(e){
      var self = this;
      e.preventDefault();
      e.stopPropagation();
      console.log("upPublicacion");
      $(".loader").fadeIn();
      if(!window.api.accion.up){
            window.api.accion.up = true;
            $.ajax({
               type: 'PATCH', 
               url: window.api.url + "/" +self.model.get('id')+"/up",
               dataType: 'json',
            success: function(data){
                console.log(data);
                self.actualizarRoot();
            },
            error: function(data){
                console.log(data);
                self.actualizarRoot();
            },
        });
      }
    },
    downPublicacion: function(e){
      var self = this;
      e.preventDefault();
      e.stopPropagation();
      console.log("downPublicacion");
      $(".loader").fadeIn();
      if(!window.api.accion.down){
        window.api.accion.down = true;
        $.ajax({
            type: 'PATCH', 
            url: window.api.url + "/" +self.model.get('id')+"/down",
            dataType: 'json',
            success: function(data){
                debugger;
                console.log(data);
                self.actualizarRoot();
            },
            error: function(data){
                debugger;
                console.log(data);
                self.actualizarRoot();
            },
        });
      }
    },
    actualizarRoot: function(){
        $("#cuerpoTabla").empty();
        window.collections.publicaciones.reset();
        var xhr = window.collections.publicaciones.fetch();
        xhr.done(function(){
           //window.routers.app.navigate('/',true);
           window.api.accion.up = false;
           window.api.accion.down = false;
           $(".loader").fadeOut();
        });
        $(".loader").fadeOut();
    }
});

//esta vista es para visualizar el show_template
Publicaciones.Views.Show = Backbone.View.extend({
    /*el: '#contenidoPagina',*/
    template: swig.compile($("#show_template").html()),
    events: {
        'click #botonRegresar': 'regresar',
        'click #botonEliminar' : 'eliminar',
    },
    initialize: function() {
        this.model.on("change", this.render, this);
        window.api.modelo.id = this.model.get('id');
    },
    regresar : function(e){
        e.preventDefault();
        e.stopPropagation();
        console.log("regresar");
        window.routers.app.navigate('/',true);
    },
    eliminar : function(e){
        $(".loader").fadeIn();
        e.preventDefault();
        e.stopPropagation();
        if(!window.api.accion.eliminar && window.api.modelo.id == this.model.get('id')){
            window.api.accion.eliminar = true;
            console.log("Accion eliminar");
            this.model.urlRoot = window.api.url;
            this.model.destroy({
                success: function(){
                    window.collections.publicaciones.reset();
                    var xhr = window.collections.publicaciones.fetch();
                    xhr.done(function(){
                        window.routers.app.navigate('/',true);
                        $(".loader").fadeOut();
                        window.api.accion.eliminar = false;
                    });
                }
            });
        }
    },
    render: function() {
        var data = this.model.toJSON();
        this.$el.html(this.template(data));
        var self = this;
        $.ajax({
           url: window.api.urlPublicacionesGalerias,
           type: 'GET',
           data: {publicacion: self.model.get('id')},
           dataType: 'html',
           success: function(data){
               self.$el.find("#galeria").html(data);
               createUploader();
               refrescarGaleria();
           },
           error: function(data){
               console.log("error");
               console.log(data);
           }
        });
        return this;
    }
});

//esta vista es para visualizar el formulario
Publicaciones.Views.FormNew = Backbone.View.extend({
    /*el: '#contenidoPagina',*/
    events: {
        'click #botonRegresar': 'regresar',
        'click #botonGuardar' : 'guardar',
    },
    initialize: function(data) {
        this.contenido = data;
        window.api.modelo.id = 0;
    },
    regresar : function(e){
        e.stopPropagation();
        console.log("regresar");
        window.routers.app.navigate('/',true);
    },
    guardar: function(e){
        debugger;
        e.preventDefault();
        e.stopPropagation();
        var self = this;
        if(!window.api.accion.guardar  && window.api.modelo.id == 0){
            window.api.accion.guardar=true;
            if(this.validarForm()){
                $(".loader").fadeIn();
                var data = $("#formPublicaciones").serialize();
                $.ajax({
                    url: window.api.url,
                    type: 'POST',
                    data: data,
                    dataType: 'json',
                }).done(function(data, textStatus,jqXHR){
                    debugger;
                    window.api.accion.guardar = false;
                    console.log("Creado")
                    console.log(data)
                    var model = new Publicaciones.Models.Publicacion(data);
                    window.collections.publicaciones.add(model);
                    window.routers.app.navigate("show/"+model.get('id'),true);
                    $(".loader").fadeOut();
                }).fail(function(data, textStatus,jqXHR){
                    debugger;
                    window.api.accion.guardar = false;
                    $(".loader").fadeOut();
                    console.log(data);
                    self.parseErrores(data);
                });
            }else{
                $(".loader").fadeOut();
                window.api.accion.guardar = false;
            }
        }
    },
    render: function() {
        this.$el.html(this.contenido.data);
        return this;
    },
    validarForm: function(){
        var $titulo = $("input#titulo");
        var $desCorta = $("textarea#descripcionCorta");
        var $contenido = $("textarea#contenido");
        // validar el nombre 
        if($titulo.val().length == 0){
            this.errorNoty("El titulo esta vacio.");
            $titulo.focus();
            return false;
        }else if($titulo.val().length < 3){
            this.errorNoty("El titulo es demasiado corto, minimo 3 caracteres");
            $titulo.focus();
            return false;
        }
        
        // validar el nombre 
        if($desCorta.val().length == 0){
            this.errorNoty("La descripcion corta esta vacia.");
            $desCorta.focus();
            return false;
        }else if($desCorta.val().length < 10){
            this.errorNoty("La descripcion corta esta muy corta, minimo 10 caracteres");
            $desCorta.focus();
            return false;
        }
        
        // validar el nombre 
        if($contenido.val().length == 0){
            this.errorNoty("El contenido esta vacio.");
            $contenido.focus();
            return false;
        }else if($contenido.val().length < 10){
            this.errorNoty("El contenido es demasiado corto, minimo 10 caracteres");
            $contenido.focus();
            return false;
        }
        
        return true;
    },
    errorNoty: function(mensaje){
        noty({text: mensaje, layout:'topRight', type:'error',timeout:2000});
    },
    parseErrores: function(data){
        debugger;
        var json = $.parseJSON(data.responseText);
         var children = json.errors.children;
        var stringError ="";
        var cont=0;
        var contb=0;
        for(cont = 0; cont< children.length;  cont++){
            if(children[cont]['errors']){
                for(contb=0; contb<children[cont]['errors'];contb++){
                    stringError +=children[cont]['errors'][contb];
                }
            }
        }
        this.errorNoty(stringError);
    },
    enableEditor: function(){
        /* CL Editor */
        $(".cleditor").cleditor({width: "auto",height: "auto"});
        //initTinyMCE();
    }
});

//esta vista es para visualizar el formulario
Publicaciones.Views.FormEdit = Backbone.View.extend({
    /*el: '#contenidoPagina',*/
    events: {
        'click #botonRegresar': 'regresar',
        'click #botonGuardar' : 'guardar',
        'click #botonEliminar' : 'eliminar',
    },
    initialize: function(data) {
        this.contenido = data;
        window.api.modelo.id = this.model.get('id');
        var categoria = this.model.get('categoria');
        window.api.categoria = categoria.id;
    },
    regresar : function(e){
        e.stopPropagation();
        console.log("regresar");
        window.routers.app.navigate('/',true);
    },
    guardar: function(e){
        debugger;
        e.preventDefault();
        e.stopPropagation();
        if(!window.api.accion.guardar && window.api.modelo.id == this.model.get('id')){
            window.api.accion.guardar = true;
            var self = this;
            if(this.validarForm()){
                $(".loader").fadeIn();
                this.model.set({'nombre': $("input#nombre").val()});
                var data = $("#formPublicaciones").serialize();
                $.ajax({
                    url: window.api.url + "/" +window.api.modelo.id,
                    type: 'PUT',
                    data: data,
                    dataType: 'json',
                }).done(function(data, textStatus, jqXHR){
                    window.api.accion.guardar = false;
                    window.collections.publicaciones.reset();
                    var xhr = window.collections.publicaciones.fetch();
                    xhr.done(function(){
                        window.routers.app.navigate('show/'+window.api.modelo.id,true);
                        $(".loader").fadeOut();
                    });
                }).fail(function(data, textStatus, errorThrown){
                   debugger;
                   window.api.accion.guardar = false;
                   $(".loader").fadeOut();
                   console.log($.parseJSON(data.responseText));
                   self.parseErrores(data);
                });
            }else{
                window.api.accion.guardar = false;
                $(".loader").fadeOut();
            }
        }
    },
    eliminar : function(e){
        var self = this;
        $(".loader").fadeIn();
        e.preventDefault();
        e.stopPropagation();
        if(!window.api.accion.eliminar  && window.api.modelo.id == this.model.get('id')){
            window.api.accion.eliminar = true;
            console.log("Accion eliminar");
            this.model.urlRoot = window.api.url;
            this.model.destroy({
                success: function(){
                    window.collections.publicaciones.reset();
                    var xhr = window.collections.publicaciones.fetch();
                    xhr.done(function(){
                        window.routers.app.navigate('/',true);
                        window.api.accion.eliminar = false;
                        $(".loader").fadeOut();
                    });
                }
            });
        }
    },
    render: function() {
        this.$el.html(this.contenido.data);
        return this;
    },
    validarForm: function(){
        var $titulo = $("input#titulo");
        var $desCorta = $("textarea#descripcionCorta");
        var $contenido = $("textarea#contenido");
        // validar el nombre 
        if($titulo.val().length == 0){
            this.errorNoty("El titulo esta vacio.");
            $titulo.focus();
            return false;
        }else if($titulo.val().length < 3){
            this.errorNoty("El titulo es demasiado corto, minimo 3 caracteres");
            $titulo.focus();
            return false;
        }
        
        // validar el nombre 
        if($desCorta.val().length == 0){
            this.errorNoty("La descripcion corta esta vacia.");
            $desCorta.focus();
            return false;
        }else if($desCorta.val().length < 10){
            this.errorNoty("La descripcion corta esta muy corta, minimo 10 caracteres");
            $desCorta.focus();
            return false;
        }
        
        // validar el nombre 
        if($contenido.val().length == 0){
            this.errorNoty("El contenido esta vacio.");
            $contenido.focus();
            return false;
        }else if($contenido.val().length < 10){
            this.errorNoty("El contenido es demasiado corto, minimo 10 caracteres");
            $contenido.focus();
            return false;
        }
        
        return true;
    },
    errorNoty: function(mensaje){
         noty({text: mensaje, layout:'topRight', type:'error',timeout:2000});
    },
    parseErrores: function(data){
        debugger;
        var json = $.parseJSON(data.responseText);
        var children = json.errors.children;
        var stringError ="";
        var cont=0;
        var contb=0;
        for(cont = 0; cont< children.length;  cont++){
            if(children[cont]['errors']){
                for(contb=0; contb<children[cont]['errors'];contb++){
                    stringError +=children[cont]['errors'][contb];
                }
            }
        }
        this.errorNoty(stringError);
    },
    enableEditor: function(){
        /* CL Editor */
        $(".cleditor").cleditor({width: "auto",height: "auto"});
        //initTinyMCE();
    },
    asignaCategoria: function(){
        $("#categoria").val(window.api.categoria);
    }
});


//vista collecio que recibe todos los modelos.
Publicaciones.Views.Table = Backbone.View.extend({

    el: '#contenidoPagina',
    
    template: swig.compile($("#table_template").html()),
    
    initialize: function() {

        this.cuerpoTabla = "#cuerpoTabla";
        
        this.collection.on("add", this.AddOne,this);
        //esta es para que ejecute el render inicial
        //this.render();
        
    },
    
    AddOne: function(publicacion) {
        var publicacionView = new Publicaciones.Views.Item({model: publicacion});
        var html = publicacionView.render().el;
        $(this.cuerpoTabla).prepend(html);
    },
    
    render: function() {
        this.$el.html(this.template());
        this.collection.forEach(this.AddOne,this);
        this.inicializarDatatable();
        return this;
    },
    
    inicializarDatatable: function() {
        $('#datatable').dataTable({
            "sPaginationType": "full_numbers",
            "sNext": "Siguiente",
            "sLast": "Ultimo",
            "sFirst": "Primero",
            "sPrevious": "Anterior",
        });
    },
});

Publicaciones.Routers.App = Backbone.Router.extend({
    routes: {
        "" : "root",
        "new" : "new",
        "edit/:id" : "edit",
        "show/:id" : "show"
    },
    
    root: function() {
        window.views.table = new Publicaciones.Views.Table({
                collection: window.collections.publicaciones,
        });
        views.table.render();
    },
    
    new: function() {
        //$("#contenedorEditor").remove();
        $(".loader").fadeIn();
        $.ajax({
           type: 'GET',
           url: window.api.url + "/new",
           dataType: 'html',
           data: {usuario: window.api.usuario},
        }).done(function(data){
            if(window.views.formEdit)window.views.formEdit.remove();
            if(window.views.show)window.views.show.remove();
            window.views.formNuevo = new  Publicaciones.Views.FormNew({data: data});
            $("#contenidoPagina").html(views.formNuevo.render().el).fadeIn("fast");
            views.formNuevo.enableEditor();
            $(".loader").fadeOut();
            $("input#usuario").val(window.api.usuario);
        }).fail(function(){
            $(".loader").fadeOut();
            alert("Error al cargar la pagina de nuevo registro");
        });
    },
    edit: function(id) {
        //$("#contenedorEditor").remove();
        $(".loader").fadeIn();
        $.ajax({
           type: 'GET', 
           url: window.api.url + "/" +id+"/edit",
           dataType: 'html',
        }).done(function(data){
            if(window.views.formNuevo)window.views.formNuevo.remove();
            if(window.views.show)window.views.show.remove();
            var model = window.collections.publicaciones.get(id);
            window.views.formEdit = new  Publicaciones.Views.FormEdit({data: data, model: model});
            $("#contenidoPagina").html(views.formEdit.render().el).fadeIn("fast");
            views.formEdit.enableEditor();
            $(".loader").fadeOut();
            $("input#usuario").val(window.api.usuario);
            views.formEdit.asignaCategoria();
        }).fail(function(){
            $(".loader").fadeOut();
            alert("Error al cargar la pagina de editar registro");
        });
    },
    show: function(id) {
        if(window.views.formNuevo)window.views.formNuevo.remove();
        if(window.views.formEdit)window.views.formEdit.remove();
        var model = window.collections.publicaciones.get(id);
        window.views.show = new  Publicaciones.Views.Show({model: model});
        $("#contenidoPagina").html(views.show.render().el).fadeIn("fast");
    },
});

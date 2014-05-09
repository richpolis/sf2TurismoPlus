<?php

namespace Richpolis\PublicacionesBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

use Richpolis\BackendBundle\Repository\UsuariosRepository;
use Richpolis\PublicacionesBundle\Repository\CategoriaPublicacionRepository;

class PublicacionType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('tituloEs','text',array(
                'label'=>'Titulo español','required'=>true,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Titulo en español',
                    'data-bind'=>'value: titulo'
                    )
                ))    
            ->add('descripcionEs',null,array(
                'label'=>'Descripcion español',
                'required'=>true,
                'attr'=>array(
                    'class'=>'cleditor tinymce form-control placeholder',
                   'data-theme' => 'advanced',
                    )
                ))
            ->add('paqueteEs','text',array(
                'label'=>'Paquete español','required'=>false,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'El paquete del tour en español',
                    'data-bind'=>'value: paquete'
                    )
                ))
            ->add('precioEs',null,array(
                'label'=>'Precio español','required'=>false,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Precio del tour en español',
                    'data-bind'=>'value: precio'
                    )
                ))
            ->add('tituloEn','text',array(
                'label'=>'Titulo ingles','required'=>true,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Titulo',
                    'data-bind'=>'value: titulo'
                    )
                ))    
            ->add('descripcionEn',null,array(
                'label'=>'Descripcion ingles',
                'required'=>true,
                'attr'=>array(
                    'class'=>'cleditor tinymce form-control placeholder',
                   'data-theme' => 'advanced',
                    )
                ))
            ->add('paqueteEn','text',array(
                'label'=>'Paquete ingles','required'=>false,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Paquete',
                    'data-bind'=>'value: paquete'
                    )
                ))
            ->add('precioEn',null,array(
                'label'=>'Precio ingles','required'=>false,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Precio',
                    'data-bind'=>'value: precio'
                    )
                ))
            ->add('tituloFr','text',array(
                'label'=>'Titulo frances','required'=>true,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Titulo',
                    'data-bind'=>'value: titulo'
                    )
                ))    
            ->add('descripcionFr',null,array(
                'label'=>'Descripcion frances',
                'required'=>true,
                'attr'=>array(
                    'class'=>'cleditor tinymce form-control placeholder',
                   'data-theme' => 'advanced',
                    )
                ))
            ->add('paqueteFr','text',array(
                'label'=>'Paquete frances','required'=>false,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Paquete',
                    'data-bind'=>'value: paquete'
                    )
                ))
            ->add('precioFr',null,array(
                'label'=>'Precio frances','required'=>false,'attr'=>array(
                    'class'=>'form-control placeholder',
                    'placeholder'=>'Precio',
                    'data-bind'=>'value: precio'
                    )
                ))     
            ->add('categoria',null,array(
                'label'=>'Categoria',
                'required'=>true,
                'attr'=>array(
                    'class'=>'validate[required] form-control placeholder',
                    'placeholder'=>'Categoria',
                    'data-bind'=>'value: categoria'
                    )
                ))
			->add('file','file',array('label'=>'Imagen','attr'=>array(
                'class'=>'form-control placeholder',
                'placeholder'=>'Imagen pagina',
                'data-bind'=>'value: imagen pagina'
             )))
			->add('isActive',null,array('label'=>'Activo?','attr'=>array(
                'class'=>'checkbox-inline',
                'placeholder'=>'Es activo',
                'data-bind'=>'value: isActive'
                )))
            ->add('inCarrusel',null,array('label'=>'Carrusel?','attr'=>array(
                'class'=>'checkbox-inline',
                'placeholder'=>'Esta en carrusel',
                'data-bind'=>'value: inCarrusel'
                )))
            ->add('imagen','hidden')
            ->add('position','hidden')
			->add('usuario','hidden')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Richpolis\PublicacionesBundle\Entity\Publicacion',
            'csrf_protection' => true
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'richpolis_publicacionesbundle_publicacion';
    }
}

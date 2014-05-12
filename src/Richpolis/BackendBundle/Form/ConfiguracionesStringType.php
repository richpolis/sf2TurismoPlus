<?php

namespace Richpolis\BackendBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

use Richpolis\BackendBundle\Entity\Configuraciones;

class ConfiguracionesStringType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('configuracion','text',array(
                'label'=>'Configuracion',
                'required'=>true,
                'attr'=>array(
                    'class'=>'validate[required] form-control placeholder',
                    'placeholder'=>'Configuracion',
                    'data-bind'=>'value: configuracion'
             )))
            ->add('texto','text',array(
                'label'=>'Valor',
                'required'=>true,
                'attr'=>array(
                    'class'=>'validate[required] form-control placeholder',
                    'placeholder'=>'Valor',
                    'data-bind'=>'value: valor'
             )))
            ->add('slug','hidden')
            ->add('tipoConfiguracion','hidden')    
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Richpolis\BackendBundle\Entity\Configuraciones'
        ));
    }

    public function getName()
    {
        return 'richpolis_backendbundle_configuracionestype';
    }
}

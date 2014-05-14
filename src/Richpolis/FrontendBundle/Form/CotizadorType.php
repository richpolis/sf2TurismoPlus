<?php

namespace Richpolis\FrontendBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class CotizadorType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name','text',array('required'=>true))
            ->add('email','email',array('required'=>true))
            ->add('telefono','text',array('required'=>true))
            ->add('pais','text',array('required'=>false))                
            ->add('salida','text',array('required'=>true))
            ->add('fechaSalida','text',array('required'=>true))
            ->add('horaSalida','text',array('required'=>true))
            ->add('destino','text',array('required'=>true))
            ->add('pasajeros','number',array('required'=>true))
            ->add('autobus','number',array('required'=>true))    
            ->add('fechaRegreso','text',array('required'=>true))
            ->add('horaRegreso','text',array('required'=>true))
            ->add('comentarios','textarea',array('required'=>true))

        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Richpolis\FrontendBundle\Entity\Cotizador'
        ));
    }

    public function getName()
    {
        return 'cotizador';
    }
}

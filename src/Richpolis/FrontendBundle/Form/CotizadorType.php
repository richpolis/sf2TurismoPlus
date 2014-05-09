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
            ->add('name','text')
            ->add('email','email')
            ->add('telefono','text')
            ->add('salida','text')
            ->add('fechaSalida','text')
            ->add('horaSalida','text')
            ->add('fechaRegreso','text')
            ->add('horaRegreso','text')
            ->add('comentarios','textarea')

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

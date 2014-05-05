<?php

namespace Richpolis\PaginasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class PaginaType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('pagina')
            ->add('imagen')
            ->add('contenido')
            ->add('galerias')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Richpolis\PaginasBundle\Entity\Pagina'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'richpolis_paginasbundle_pagina';
    }
}

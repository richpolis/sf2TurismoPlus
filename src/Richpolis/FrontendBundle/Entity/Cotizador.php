<?php
// src/Blogger/BlogBundle/Entity/Enquiry.php

namespace Richpolis\FrontendBundle\Entity;

use Symfony\Component\Validator\Constraints as Assert;


class Cotizador
{
    /**
     * @Assert\NotBlank(message="El nombre no puede estar vacio.")
     */
    protected $name;

    /**
     * @Assert\Email(message="Email no es valido.")
     */
    protected $email;


    protected $telefono;
    
    /**
     * @Assert\Length(
     *     min=3,
     *     minMessage="El mensaje debe tener como minimo {{ limit }} caracteres."
     * )
     */
    protected $salida;


    /**
     * @Assert\Date()
     */
    protected $fechaSalida;


    /**
     * @Assert\Time()
     */
    protected $horaSalida;
    
    /**
     * @Assert\Date()
     */
    protected $fechaRegreso;

    /**
     * @Assert\Time()
     */
    protected $horaRegreso;


    protected $comentarios;


    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function getTelefono()
    {
        return $this->telefono;
    }

    public function setTelefono($telefono)
    {
        $this->telefono = $telefono;
    }

    public function getSalida()
    {
        return $this->salida;
    }

    public function setSalida($salida)
    {
        $this->salida = $salida;
    }


    public function getComentarios()
    {
        return $this->comentarios;
    }

    public function setComentarios($comentarios)
    {
        $this->comentarios = $comentarios;
    }
    
    public function getFechaSalida()
    {
        return $this->fechaSalida;
    }

    public function setFechaSalida($fechaSalida)
    {
        $this->fechaSalida = $fechaSalida;
    }

    public function getHoraSalida()
    {
        return $this->horaSalida;
    }

    public function setHoraSalida($horaSalida)
    {
        $this->horaSalida = $horaSalida;
    }

    public function getFechaRegreso()
    {
        return $this->fechaRegreso;
    }

    public function setFechaRegreso($fechaRegreso)
    {
        $this->fechaRegreso = $fechaRegreso;
    }

    public function getHoraRegreso()
    {
        return $this->horaRegreso;
    }

    public function setHoraRegreso($horaRegreso)
    {
        $this->horaRegreso = $horaRegreso;
    }

}
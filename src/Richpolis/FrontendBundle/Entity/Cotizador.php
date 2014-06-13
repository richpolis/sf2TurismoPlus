<?php
// src/Blogger/BlogBundle/Entity/Enquiry.php

namespace Richpolis\FrontendBundle\Entity;

use Symfony\Component\Validator\Constraints as Assert;


class Cotizador
{
    /**
     * @Assert\NotBlank()
     */
    protected $name;

    /**
     * @Assert\Email()
     */
    protected $email;

    /**
     * @Assert\NotBlank()
     */
    protected $telefono;
    
    protected $pais;

    protected $ciudad;
    
    /**
     * @Assert\Length(
     *     min=3
     * )
     */
    protected $salida;


    /**
     * @Assert\NotBlank()
     */
    protected $fechaSalida;


    /**
     * @Assert\NotBlank()
     */
    protected $horaSalida;
    
    /**
     * @Assert\Length(
     *     min=3
     * )
     */
    protected $destino;
    
    /**
     * @Assert\GreaterThanOrEqual(
     *     value = 1
     * )
     */
    protected $pasajeros;
    
    /**
     * @Assert\NotBlank()
     */
    protected $autobus;
    
    /**
     * @Assert\NotBlank()
     */
    protected $fechaRegreso;

    /**
     * @Assert\NotBlank()
     */
    protected $horaRegreso;


    protected $itinerario;

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
    
    public function getPais()
    {
        return $this->pais;
    }

    public function setPais($pais)
    {
        $this->pais = $pais;
    }
    
    public function getDestino()
    {
        return $this->destino;
    }

    public function setDestino($destino)
    {
        $this->destino = $destino;
    }
    
    public function getPasajeros()
    {
        return $this->pasajeros;
    }

    public function setPasajeros($pasajeros)
    {
        $this->pasajeros = $pasajeros;
    }
    
        
    public function getAutobus()
    {
        return $this->autobus;
    }

    public function setAutobus($autobus)
    {
        $this->autobus = $autobus;
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

    public function getItinerario()
    {
        return $this->itinerario;
    }

    public function setItinerario($itinerario)
    {
        $this->itinerario = $itinerario;
    }

    public function getCiudad()
    {
        return $this->ciudad;
    }

    public function setCiudad($ciudad)
    {
        $this->ciudad = $ciudad;
    }

}
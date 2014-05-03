<?php

namespace Richpolis\PaginasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Pagina
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="Richpolis\PaginasBundle\Entity\PaginaRepository")
 */
class Pagina
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="pagina", type="string", length=150)
     */
    private $pagina;

    /**
     * @var string
     *
     * @ORM\Column(name="titulo", type="string", length=255)
     */
    private $titulo;

    /**
     * @var string
     *
     * @ORM\Column(name="contenido", type="text")
     */
    private $contenido;

    /**
     * @var integer
     *
     * @ORM\Column(name="galerias", type="integer")
     */
    private $galerias;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set pagina
     *
     * @param string $pagina
     * @return Pagina
     */
    public function setPagina($pagina)
    {
        $this->pagina = $pagina;

        return $this;
    }

    /**
     * Get pagina
     *
     * @return string 
     */
    public function getPagina()
    {
        return $this->pagina;
    }

    /**
     * Set titulo
     *
     * @param string $titulo
     * @return Pagina
     */
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;

        return $this;
    }

    /**
     * Get titulo
     *
     * @return string 
     */
    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * Set contenido
     *
     * @param string $contenido
     * @return Pagina
     */
    public function setContenido($contenido)
    {
        $this->contenido = $contenido;

        return $this;
    }

    /**
     * Get contenido
     *
     * @return string 
     */
    public function getContenido()
    {
        return $this->contenido;
    }

    /**
     * Set galerias
     *
     * @param integer $galerias
     * @return Pagina
     */
    public function setGalerias($galerias)
    {
        $this->galerias = $galerias;

        return $this;
    }

    /**
     * Get galerias
     *
     * @return integer 
     */
    public function getGalerias()
    {
        return $this->galerias;
    }
}

<?php

namespace Richpolis\FrontendBundle\Repository;

use Doctrine\ORM\EntityRepository;

/**
 * AutobusRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class AutobusRepository extends EntityRepository
{
    public function getMaxPosicion(){
        $em=$this->getEntityManager();
       
        $query=$em->createQuery('
            SELECT MAX(a.position) as value 
            FROM FrontendBundle:Autobus a 
            ORDER BY a.position ASC
        ');
        
        $max=$query->getResult();
        return $max[0]['value'];
    }
    
	public function findAll(){
        $em=$this->getEntityManager();
        $query=$em->createQuery('
               SELECT a
               FROM FrontendBundle:Autobus a 
               WHERE a.isActive = :autobus 
               ORDER BY a.position ASC 
        ')->setParameters(array('autobus'=> true));
        
        return $query->getResult();
    }
	
    public function findActivos(){
        $em=$this->getEntityManager();
        $query=$em->createQuery('
               SELECT a, g
               FROM FrontendBundle:Autobus a 
			   JOIN a.galerias g 
               WHERE a.isActive = :autobus 
			   AND g.isActive = :galeria 
               ORDER BY a.position ASC, g.position ASC 
        ')->setParameters(array('autobus'=> true,'galeria'=>true));
        
        return $query->getResult();
    }
}

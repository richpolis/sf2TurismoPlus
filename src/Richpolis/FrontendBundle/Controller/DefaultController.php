<?php

namespace Richpolis\FrontendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     * @Template()
     */
    public function indexAction()
    {
        return array();
    }
    
    /**
     * @Route("/nosotros", name="frontend_nosotros")
     * @Template()
     */
    public function nosotrosAction()
    {
        return array();
    }
    
    /**
     * @Route("/autobuses", name="frontend_autobuses")
     * @Template()
     */
    public function autobusesAction()
    {
        return array();
    }
    
    /**
     * @Route("/servicios", name="frontend_servicios")
     * @Template()
     */
    public function serviciosAction()
    {
        return array();
    }
    
    /**
     * @Route("/cotizador", name="frontend_cotizador")
     * @Template()
     */
    public function cotizadorAction()
    {
        return array();
    }
    
    /**
     * @Route("/tours", name="frontend_tours")
     * @Template()
     */
    public function toursAction()
    {
        return array();
    }
    
    /**
     * @Route("/contacto", name="frontend_contacto")
     * @Method({"GET", "POST"})
     * @Template("FrontendBundle:Default:contacto.html.twig")
     */
    public function contactoAction() {
        $contacto = new Contacto();
        $form = $this->createForm(new ContactoType(), $contacto);
        $request = $this->getRequest();
        
        if ($request->getMethod() == 'POST') {
            
            $form->handleRequest($request);

            if ($form->isValid()) {
                $datos=$form->getData();
                
                $message = \Swift_Message::newInstance()
                        ->setSubject('Contacto desde pagina')
                        ->setFrom($datos->getEmail())
                        ->setTo($this->container->getParameter('richpolis.emails.to_email'))
                        ->setBody($this->renderView('FrontendBundle:Default:contactoEmail.html.twig', array('datos' => $datos)), 'text/html');
                $this->get('mailer')->send($message);

                // Redirige - Esto es importante para prevenir que el usuario
                // reenvíe el formulario si actualiza la página
                $ok=true;
                $error=false;
                $mensaje="Se ha enviado el mensaje";
                $contacto = new Contacto();
                $form = $this->createForm(new ContactoType(), $contacto);
            }else{
                $ok=false;
                $error=true;
                $mensaje="El mensaje no se ha podido enviar";
            }
        }else{
            $ok=false;
            $error=false;
            $mensaje="";
        }
        
        return array(
              /*'configuraciones'=>$configuraciones,*/
              'form' => $form->createView(),
              'ok'=>$ok,
              'error'=>$error,
              'mensaje'=>$mensaje,
        );
    }
    
    
}

<?php

namespace Richpolis\FrontendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;


use Richpolis\FrontendBundle\Entity\Contacto;
use Richpolis\FrontendBundle\Form\ContactoType;

use Richpolis\FrontendBundle\Entity\Cotizador;
use Richpolis\FrontendBundle\Form\CotizadorType;



class DefaultController extends Controller
{
    /**
     * Entrada por default.
     *
     * @Route("/")
     */
    public function entradaAction()
    {
        $locale = $this->getRequest()->getLocale();
        return $this->redirect($this->generateUrl('homepage',array('_locale'=>$locale)));
    }
    
    /**
     * @Route("/{_locale}/", name="homepage", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
     * @Template()
     */
    public function indexAction()
    {
        return array();
    }
    
    /**
     * @Route("/{_locale}/nosotros", name="frontend_nosotros", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
     * @Template()
     */
    public function nosotrosAction()
    {
        return array();
    }
    
    /**
     * @Route("/{_locale}/autobuses", name="frontend_autobuses", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
     * @Template()
     */
    public function autobusesAction()
    {
        return array();
    }
    
    /**
     * @Route("/{_locale}/servicios", name="frontend_servicios", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
     * @Template()
     */
    public function serviciosAction()
    {
        return array();
    }
    
    
    /**
     * @Route("/{_locale}/tours", name="frontend_tours", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
     * @Template()
     */
    public function toursAction()
    {
        return array();
    }
    
    /**
     * @Route("/{_locale}/contacto", name="frontend_contacto", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
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
              'form' => $form->createView(),
              'ok'=>$ok,
              'error'=>$error,
              'mensaje'=>$mensaje,
        );
    }

    /**
     * @Route("/{_locale}/cotizador", name="frontend_cotizador", defaults={"_locale" = "es"}, requirements={"_locale" = "en|es|fr"})
     * @Method({"GET", "POST"})
     * @Template("FrontendBundle:Default:cotizador.html.twig")
     */
    public function cotizadorAction() {
        $cotizador = new Cotizador();
        $form = $this->createForm(new CotizadorType(), $cotizador);
        $request = $this->getRequest();
        
        if ($request->getMethod() == 'POST') {
            
            $form->handleRequest($request);

            if ($form->isValid()) {
                $datos=$form->getData();
                
                $message = \Swift_Message::newInstance()
                        ->setSubject('Solicitud de cotización')
                        ->setFrom($datos->getEmail())
                        ->setTo($this->container->getParameter('richpolis.emails.to_email'))
                        ->setBody($this->renderView('FrontendBundle:Default:cotizadorEmail.html.twig', array('datos' => $datos)), 'text/html');
                $this->get('mailer')->send($message);

                // Redirige - Esto es importante para prevenir que el usuario
                // reenvíe el formulario si actualiza la página
                $ok=true;
                $error=false;
                $mensaje="Se ha enviado el mensaje";
                $contacto = new Cotizador();
                $form = $this->createForm(new CotizadorType(), $cotizador);
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
              'form' => $form->createView(),
              'ok'=>$ok,
              'error'=>$error,
              'mensaje'=>$mensaje,
        );
    }
    
    /**
     * Lista los ultimos tweets.
     *
     * @Route("/last-tweets/{username}/", name="last_tweets")
     */
    public function lastTweetsAction($username, $limit = 10, $age = null)
    {
        /* @var $twitter FetcherInterface */
        $twitter = $this->get('knp_last_tweets.last_tweets_fetcher');

        try {
            $tweets = $twitter->fetch($username, $limit);
        } catch (TwitterException $e) {
            $tweets = array();
        }

        $response = $this->render('FrontendBundle:Default:lastTweets.html.twig', array(
            'username' => $username,
            'tweets'   => $tweets,
        ));

        if ($age) {
            $response->setSharedMaxAge($age);
        }

        return $response;
    }
    
}

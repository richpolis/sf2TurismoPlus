<?php

namespace Richpolis\PublicacionesBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Richpolis\PublicacionesBundle\Entity\Publicacion;
use Richpolis\PublicacionesBundle\Form\PublicacionType;

use Richpolis\BackendBundle\Utils\Richsys as RpsStms;

/**
 * Publicacion controller.
 *
 * @Route("/publicaciones")
 */
class PublicacionController extends Controller
{
	private $categorias = null;
    protected function getFilters()
    {
        return $this->get('session')->get('filters', array());
    }
	
	protected function setFilters($filtros)
    {
        $this->get('session')->set('filters', $filtros);
    }

    protected function getCategoriaDefault(){
        $filters = $this->getFilters();
		$cat = null;
        if(isset($filters['categorias'])){
			$categorias = $this->getCategoriasPublicacion();
            foreach($categorias as $categoria){
				if($categoria->getId()==$filters['categorias']){
					$cat = $categoria;
					break;
				}
			}
        }else{
			$categorias = $this->getCategoriasPublicacion();
			$this->setFilters(array('categorias'=>$categorias[0]->getId()));
            $cat = $categorias[0];
        }
		return $cat;
    }

    protected function getCategoriasPublicacion(){
        $em = $this->getDoctrine()->getManager();
        if($this->categorias == null){
            $this->categorias = $em->getRepository('PublicacionesBundle:CategoriaPublicacion')
                                   ->findAll();
        }
        return $this->categorias;
    }

    protected function getCategoriaActual($categoriaId){
        $categorias= $this->getCategoriasPublicacion();
        $categoriaActual=null;
        foreach($categorias as $categoria){
            if($categoria->getId()==$categoriaId){
                $categoriaActual=$categoria;
                break;
            }
        }
        return $categoriaActual;
    }	

    /**
     * Lists all Publicacion entities.
     *
     * @Route("/", name="publicaciones")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

		$categoria  = $this->getCategoriaDefault();
		
        		
        return array(
			'categoria'=>$categoria,
            'entities' => $categoria->getPublicaciones(),
        );
    }
	
	/**
     * Lists all Publicacion entities for eventos.
     *
     * @Route("/categoria/{slug}", name="publicaciones_categoria")
     * @Method("GET")
     * @Template("PublicacionesBundle:Publicacion:index.html.twig")
     */
    public function categoriaAction($slug)
    {
        $em = $this->getDoctrine()->getManager();

        $categoria = $em->getRepository('PublicacionesBundle:CategoriaPublicacion')
						->findOneBy(array('slug'=>$slug));
		
		if (!$categoria) {
            throw $this->createNotFoundException('Unable to find CategoriaPublicacion entity.');
        }
		
		$filters = $this->getFilters();
		$filters['categorias']=$categoria->getId();
		$this->setFilters($filters);
		
		return array(
			'categoria'=> $categoria,
            'entities' => $categoria->getPublicaciones(),
        );
    }
	
	
	
    /**
     * Creates a new Publicacion entity.
     *
     * @Route("/", name="publicaciones_create")
     * @Method("POST")
     * @Template("PublicacionesBundle:Publicacion:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Publicacion();
		$user = $this->getUser();
        $entity->setUsuario($user);
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('publicaciones_show', array('id' => $entity->getId())));
        }

        return array(
			'categoria'=>$this->getCategoriaDefault(),
            'entity' => $entity,
            'form'   => $form->createView(),
            'errores' => RpsStms::getErrorMessages($form)
        );
    }

    /**
    * Creates a form to create a Publicacion entity.
    *
    * @param Publicacion $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Publicacion $entity)
    {
        $form = $this->createForm(new PublicacionType(), $entity, array(
            'action' => $this->generateUrl('publicaciones_create'),
            'method' => 'POST',
        ));

        //$form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Publicacion entity.
     *
     * @Route("/new", name="publicaciones_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $publicacion = new Publicacion();
        $max=$this->getDoctrine()->getRepository('PublicacionesBundle:Publicacion')
                ->getMaxPosicion();
        
        if(!is_null($max)){
            $publicacion->setPosition($max +1);
        }else{
            $publicacion->setPosition(1);
        }
        
	    $publicacion->setCategoria($this->getCategoriaDefault());
        
        $form   = $this->createCreateForm($publicacion);

        return array(
            'categoria'=>$this->getCategoriaDefault(),
            'entity' => $publicacion,
            'form'   => $form->createView(),
            'errores' => RpsStms::getErrorMessages($form)
        );
    }

    /**
     * Finds and displays a Publicacion entity.
     *
     * @Route("/{id}", name="publicaciones_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('PublicacionesBundle:Publicacion')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Publicacion entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'categoria'=>$this->getCategoriaDefault(),
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing Publicacion entity.
     *
     * @Route("/{id}/edit", name="publicaciones_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('PublicacionesBundle:Publicacion')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Publicacion entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'categoria'=>$entity->getCategoria(),
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'errores' => RpsStms::getErrorMessages($editForm)
        );
    }

    /**
    * Creates a form to edit a Publicacion entity.
    *
    * @param Publicacion $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Publicacion $entity)
    {
        $form = $this->createForm(new PublicacionType(), $entity, array(
            'action' => $this->generateUrl('publicaciones_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        //$form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    
    /**
     * Edits an existing Publicacion entity.
     *
     * @Route("/{id}", name="publicaciones_update")
     * @Method("PUT")
     * @Template("PublicacionesBundle:Publicacion:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('PublicacionesBundle:Publicacion')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Publicacion entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('publicaciones_edit', array('id' => $id)));
        }

        return array(
            'categoria'      => $entity->getCategoria(),
            'entity'      => $entity,
            'form'        => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'errores'     => RpsStms::getErrorMessages($editForm)
        );
    }
    
    /**
     * Deletes a Publicacion entity.
     *
     * @Route("/{id}", name="publicaciones_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('PublicacionesBundle:Publicacion')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Publicacion entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('publicaciones'));
    }

    /**
     * Creates a form to delete a Publicacion entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('publicaciones_delete', array('id' => $id)))
            ->setMethod('DELETE')
            /*->add('submit', 'submit', array(
                'label' => 'Eliminar',
                'attr'=>array(
                    'class'=>'btn btn-danger'
            )))*/
            ->getForm()
        ;
    }
}

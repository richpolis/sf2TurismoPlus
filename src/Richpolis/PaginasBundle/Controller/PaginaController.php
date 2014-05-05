<?php

namespace Richpolis\PaginasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Richpolis\PaginasBundle\Entity\Pagina;
use Richpolis\PaginasBundle\Form\PaginaType;

/**
 * Pagina controller.
 *
 * @Route("/paginas")
 */
class PaginaController extends Controller
{

    /**
     * Lists all Pagina entities.
     *
     * @Route("/", name="paginas")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('PaginasBundle:Pagina')->findAll();

        return array(
            'entities' => $entities,
        );
    }
    /**
     * Creates a new Pagina entity.
     *
     * @Route("/", name="paginas_create")
     * @Method("POST")
     * @Template("PaginasBundle:Pagina:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Pagina();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('paginas_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
    * Creates a form to create a Pagina entity.
    *
    * @param Pagina $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(Pagina $entity)
    {
        $form = $this->createForm(new PaginaType(), $entity, array(
            'action' => $this->generateUrl('paginas_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Pagina entity.
     *
     * @Route("/new", name="paginas_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new Pagina();
        $form   = $this->createCreateForm($entity);

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a Pagina entity.
     *
     * @Route("/{id}", name="paginas_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('PaginasBundle:Pagina')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Pagina entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing Pagina entity.
     *
     * @Route("/{id}/edit", name="paginas_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('PaginasBundle:Pagina')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Pagina entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
    * Creates a form to edit a Pagina entity.
    *
    * @param Pagina $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Pagina $entity)
    {
        $form = $this->createForm(new PaginaType(), $entity, array(
            'action' => $this->generateUrl('paginas_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Pagina entity.
     *
     * @Route("/{id}", name="paginas_update")
     * @Method("PUT")
     * @Template("PaginasBundle:Pagina:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('PaginasBundle:Pagina')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Pagina entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('paginas_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a Pagina entity.
     *
     * @Route("/{id}", name="paginas_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('PaginasBundle:Pagina')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Pagina entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('paginas'));
    }

    /**
     * Creates a form to delete a Pagina entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('paginas_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}

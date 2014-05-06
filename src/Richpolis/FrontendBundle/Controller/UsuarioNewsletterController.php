<?php

namespace Richpolis\FrontendBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Richpolis\FrontendBundle\Entity\UsuarioNewsletter;
use Richpolis\FrontendBundle\Form\UsuarioNewsletterType;

use Richpolis\BackendBundle\Utils\Richsys as RpsStms;

/**
 * UsuarioNewsletter controller.
 *
 * @Route("/backend/usuarios/newsletter")
 */
class UsuarioNewsletterController extends Controller
{

    /**
     * Lists all UsuarioNewsletter entities.
     *
     * @Route("/", name="users_newsletter")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('FrontendBundle:UsuarioNewsletter')->findAll();

        return array(
            'entities' => $entities,
        );
    }
    /**
     * Creates a new UsuarioNewsletter entity.
     *
     * @Route("/", name="users_newsletter_create")
     * @Method("POST")
     * @Template("FrontendBundle:UsuarioNewsletter:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new UsuarioNewsletter();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('users_newsletter_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
            'errores' => RpsStms::getErrorMessages($form)
        );
    }

    /**
    * Creates a form to create a UsuarioNewsletter entity.
    *
    * @param UsuarioNewsletter $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createCreateForm(UsuarioNewsletter $entity)
    {
        $form = $this->createForm(new UsuarioNewsletterType(), $entity, array(
            'action' => $this->generateUrl('users_newsletter_create'),
            'method' => 'POST',
        ));

        //$form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new UsuarioNewsletter entity.
     *
     * @Route("/new", name="users_newsletter_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new UsuarioNewsletter();
        $form   = $this->createCreateForm($entity);

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
            'errores' => RpsStms::getErrorMessages($form)
        );
    }

    /**
     * Finds and displays a UsuarioNewsletter entity.
     *
     * @Route("/{id}", name="users_newsletter_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FrontendBundle:UsuarioNewsletter')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find UsuarioNewsletter entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing UsuarioNewsletter entity.
     *
     * @Route("/{id}/edit", name="users_newsletter_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FrontendBundle:UsuarioNewsletter')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find UsuarioNewsletter entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'errores' => RpsStms::getErrorMessages($editForm)
        );
    }

    /**
    * Creates a form to edit a UsuarioNewsletter entity.
    *
    * @param UsuarioNewsletter $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(UsuarioNewsletter $entity)
    {
        $form = $this->createForm(new UsuarioNewsletterType(), $entity, array(
            'action' => $this->generateUrl('users_newsletter_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        //$form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing UsuarioNewsletter entity.
     *
     * @Route("/{id}", name="users_newsletter_update")
     * @Method("PUT")
     * @Template("FrontendBundle:UsuarioNewsletter:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('FrontendBundle:UsuarioNewsletter')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find UsuarioNewsletter entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('users_newsletter_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'form'        => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'errores'     => RpsStms::getErrorMessages($editForm)
        );
    }
    /**
     * Deletes a UsuarioNewsletter entity.
     *
     * @Route("/{id}", name="users_newsletter_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('FrontendBundle:UsuarioNewsletter')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find UsuarioNewsletter entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('users_newsletter'));
    }

    /**
     * Creates a form to delete a UsuarioNewsletter entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('users_newsletter_delete', array('id' => $id)))
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

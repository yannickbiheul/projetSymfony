<?php

namespace App\Controller;

use App\Form\AnimalType;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Animal;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminAnimalController extends AbstractController
{

    /**
     * @Route("/admin/animal/creation", name="admin_animal_ajout")
     * @Route("/admin/animal/{id}", name="admin_animal_modif")
     */
    public function modification(Animal $animal = null, Request $request, EntityManagerInterface $entityManager) {

        if (!$animal) {
            $animal = new Animal();
        }

        $form = $this->createForm(AnimalType::class, $animal);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($animal);
            $entityManager->flush();
            return $this->redirectToRoute("animal");
        }

        return $this->render('admin_animal/index.html.twig', [
            "animal" => $animal,
            "form" => $form->createView()
        ]);

    }
}

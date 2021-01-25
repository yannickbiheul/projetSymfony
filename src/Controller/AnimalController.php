<?php

namespace App\Controller;

use App\Entity\Animal;
use App\Repository\AnimalRepository;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AnimalController extends AbstractController
{
    /**
     * @Route("/", name="animal")
     */
    public function index(AnimalRepository $repository)
    {
        $animaux = $repository->findAll();
        return $this->render('animal/index.html.twig', [
            'animaux' => $animaux
        ]);
    }

    /**
     * @Route("/animal/{id}", name="afficher_animal")
     */
    public function afficherAnimal(AnimalRepository $repository, $id)
    {
        $unAnimal = $repository->find($id);
        return $this->render('animal/afficherAnimal.html.twig', [
            'animal' => $unAnimal
        ]);
    }

    /**
     * @Route("/animal/{poids}", name="animauxLegers")
     */
    public function getAnimalLeger(AnimalRepository $repo, $poids) {
        $animaux = $repo->getAnimauxLegers($poids);
            return $this->render('animal/animauxLegers.html.twig', [
                'animaux' => $animaux
        ]);
        
    }
}

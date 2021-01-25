<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

use App\Entity\Animal;
use App\Entity\Espece;
use App\Entity\Personne;
use App\Entity\Dispose;

class AnimalFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);

        $e1 = new Espece();
        $e1->setLibelle("mammifere")->setDescription("nourris avec du lait");
        $manager->persist($e1);

        $e2 = new Espece();
        $e2->setLibelle("poisson")->setDescription("nourris avec du plancton");
        $manager->persist($e2);

        $a1 = new Animal();
        $a1->setColor('black')->setNom('horse')->setFamille('mamif')->setPoids(125)->setEspece($e1);
        $manager->persist($a1);

        $a2 = new Animal();
        $a2->setColor('blue')->setNom('cow')->setFamille('mamif')->setPoids(185)->setEspece($e1);
        $manager->persist($a2);

        $a3 = new Animal();
        $a3->setColor('grey')->setNom('poissonChat')->setFamille('poisson')->setPoids(15)->setEspece($e2);
        $manager->persist($a3);

        $p1 = new Personne();
        $p1->setNom('Barnabé');
        $manager->persist($p1);

        $p2 = new Personne();
        $p2->setNom('Mireille');
        $manager->persist($p2);

        $d1 = new Dispose();
        $d1->setPersonne($p1)
            ->setAnimal($a1)
            ->setNombre(10);
        $manager->persist($d1);
        
        $manager->flush();
    }
}

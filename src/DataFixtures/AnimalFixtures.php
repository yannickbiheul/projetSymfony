<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

use App\Entity\Animal;

class AnimalFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // $product = new Product();
        // $manager->persist($product);

        $a1 = new Animal();
        $a1->setColor('black')->setNom('horse')->setFamille('mamif');
        $manager->persist($a1);

        $a2 = new Animal();
        $a2->setColor('blue')->setNom('cow')->setFamille('mamif');
        $manager->persist($a2);

        $manager->flush();
    }
}

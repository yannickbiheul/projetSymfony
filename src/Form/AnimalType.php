<?php

namespace App\Form;

use App\Entity\Animal;
use App\Entity\Espece;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class AnimalType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom')
                ->add('color')
                ->add('famille')
                ->add('poids')
                ->add('espece', EntityType::class, [
                    'class' => Espece::class,
                    'choice_label' => 'libelle'
                ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Animal::class,
        ]);
    }
}

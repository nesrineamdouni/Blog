<?php

namespace App\Form;

use App\Entity\Posts;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Entity\Categories;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\DataTransformerInterface;
use App\Form\DateTimeToImmutableTransformer; // Ajoutez cette ligne pour importer le transformateur

class PostsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title')
            ->add('content')
            ->add('created_at', DateTimeType::class, [
                'widget' => 'single_text',
                'label' => 'Date',
                'attr' => ['class' => 'form-control'],
            ])
            ->add('category_id', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'name',
                'label' => 'Category',
            ])
            ->add('imagePath', FileType::class, [
                'label' => 'Image (JPEG, PNG)',
                'mapped' => false,
                'required' => false,
            ]);
            $builder->get('created_at')->addModelTransformer(new DateTimeToImmutableTransformer());
    
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Posts::class,
        ]);
    }
}
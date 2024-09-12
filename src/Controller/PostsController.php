<?php

namespace App\Controller;

use App\Entity\Posts;
use App\Form\PostsType;
use App\Repository\PostsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Comments;
use Symfony\Component\Mime\MimeTypes;
use App\Form\CommentsType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

#[Route('/posts')]
class PostsController extends AbstractController
{
    #[Route('/', name: 'app_posts_index', methods: ['GET'])]
public function index(PostsRepository $postsRepository): Response
{
    // Récupérer tous les posts
    $posts = $postsRepository->findAll();

    // Créer un tableau vide pour stocker les usernames des auteurs
    $usernames = [];

    // Récupérer les usernames des auteurs de chaque post
    foreach ($posts as $post) {
        $usernames[] = $post->getUsernameUser();
    }

    return $this->render('posts/index.html.twig', [
        'posts' => $posts,
        'usernames' => $usernames, // Envoyer les usernames à la vue
    ]);
}
#[Route('/new', name: 'app_posts_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $post = new Posts();
        $form = $this->createForm(PostsType::class, $post);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $imageFile = $form['imagePath']->getData();

            if ($imageFile) {
                $mimeTypeGuesser = MimeTypes::getDefault();
                $extension = $mimeTypeGuesser->getExtensions($imageFile->getMimeType())[0] ?? 'bin';
                $newFilename = uniqid() . '.' . $extension;

                try {
                    $imageFile->move(
                        $this->getParameter('images_directory'),
                        $newFilename
                    );
                    $post->setImagePath($newFilename);
                } catch (FileException $e) {

                }
            }

            // Récupérer l'utilisateur connecté
            $user = $this->getUser();

            // Assurer que l'utilisateur est connecté
            if ($user) {

                $post->setAuthorId($user);
                 $post->setUsernameUser($user);
            }

            $entityManager->persist($post);
            $entityManager->flush();

            return $this->redirectToRoute('app_posts_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('posts/new.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }
    #[Route('/{id}', name: 'app_posts_show', methods: ['GET'])]
    public function show(Posts $post): Response
    {
        return $this->render('posts/show.html.twig', [
            'post' => $post,
        ]);
    }

#[Route('/{id}/comment', name: 'app_posts_comment', methods: ['GET', 'POST'])]
public function addComment(Request $request, Posts $post, EntityManagerInterface $entityManager): Response
{
    $commentContent = $request->request->get('comment');

    if (!empty($commentContent)) {
        $user = $this->getUser();

        if ($user) {
            $comment = new Comments();
            $comment->setContent($commentContent);
            $comment->setUserId($user);
            $comment->setPostId($post);

            $entityManager->persist($comment);
            $entityManager->flush();


            return $this->redirectToRoute('app_posts_show', ['id' => $post->getId()]);
        }
    }

    return $this->redirectToRoute('app_posts_index');
}

#[Route('/comment/{id}/edit', name: 'app_comment_edit', methods: ['GET', 'POST'])]
public function editComment(Request $request, Comments $comment, EntityManagerInterface $entityManager): Response
{

    $postId = $comment->getPostId()->getId(); // Récupérer l'ID du post associé au commentaire

    $form = $this->createForm(CommentsType::class, $comment);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $entityManager->flush();

        return $this->redirectToRoute('app_posts_show', ['id' => $postId]);
    }

    return $this->render('comment/edit.html.twig', [
        'comment' => $comment,
        'form' => $form->createView(),
    ]);
}


#[Route('/{id}', name: 'app_comment_confirm_delete', methods: ['POST'])]
    public function confirmDeleteComment(Request $request, Comments $comment, EntityManagerInterface $entityManager): Response
    {
            $postId = $comment->getPostId()->getId(); // Récupérer l'ID du post associé au commentaire

        if ($this->isCsrfTokenValid('delete'.$comment->getId(), $request->request->get('_token'))) {
            $entityManager->remove($comment);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_posts_show', ['id' => $postId]);
    }



    #[Route('/{id}/edit', name: 'app_posts_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Posts $post, EntityManagerInterface $entityManager): Response
{
    $form = $this->createForm(PostsType::class, $post);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $imageFile = $form['imagePath']->getData();

        // Vérifier s'il y a une nouvelle image
        if ($imageFile) {
            // Récupérer le chemin de l'ancienne image
            $oldImagePath = $post->getImagePath();

            // Supprimer l'ancienne image
            if ($oldImagePath) {
                $oldImagePath = $this->getParameter('images_directory') . '/' . $oldImagePath;
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }

            // Uploader la nouvelle image
            $mimeTypeGuesser = MimeTypes::getDefault();
            $extension = $mimeTypeGuesser->getExtensions($imageFile->getMimeType())[0] ?? 'bin';
            $newFilename = uniqid() . '.' . $extension;

            try {
                $imageFile->move(
                    $this->getParameter('images_directory'),
                    $newFilename
                );
                $post->setImagePath($newFilename);
            } catch (FileException $e) {

            }
        }

        $entityManager->flush();

        return $this->redirectToRoute('app_posts_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->renderForm('posts/edit.html.twig', [
        'post' => $post,
        'form' => $form,
    ]);
}

#[Route('/delete/{id}', name: 'app_posts_delete', methods: ['POST'])]
public function delete(Request $request, Posts $post, EntityManagerInterface $entityManager): Response
{
    if ($this->isCsrfTokenValid('delete'.$post->getId(), $request->request->get('_token'))) {
        // Récupérer le chemin complet de l'image
        $imagePath = $this->getParameter('images_directory') . '/' . $post->getImagePath();

        // Vérifier si le fichier image existe avant de le supprimer
        if (file_exists($imagePath)) {
            // Supprimer le fichier image
            unlink($imagePath);
        }

        // Supprimer l'entité post de la base de données
        $entityManager->remove($post);
        $entityManager->flush();
    }
    return $this->redirectToRoute('app_posts_index', [], Response::HTTP_SEE_OTHER);

}

}

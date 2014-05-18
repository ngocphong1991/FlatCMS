<?php
namespace CMS\AdminBundle\Entity;

use Doctrine\ORM\EntityRepository;

class SpecialGroupArticleRepository extends EntityRepository
{
    public function findAllSql()
    {
         return $this->getEntityManager()
            ->createQuery(
                'SELECT s FROM CMSAdminBundle:SpecialGroupArticle s ORDER BY s.id DESC'
            );
    }

    public function findByKeywordSql($keyword = '')
    {
        return $this->getEntityManager()
            ->createQuery(
                "SELECT s FROM CMSAdminBundle:SpecialGroupArticle s  WHERE s.name LIKE :keyword ORDER BY s.id DESC"
            )->setParameter('keyword', '%'.$keyword.'%');
    }
}
?>
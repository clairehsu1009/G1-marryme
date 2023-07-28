package com.marryme.plan.dao.impl;

import com.marryme.plan.dao.PlanDao;
import com.marryme.plan.vo.Plan;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;
import static com.marryme.common.CommonString.ACTIVE;
/**
 * ClassName: PlanDaoImpl
 * Package: marryme.plan.dao
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/8 下午 12:37
 * @Version 1.0
 */
public class PlanDaoImpl implements PlanDao {

    @Override
    public List<Plan> selectAll() {
        String hql = "FROM Plan";
        return getSession().createQuery(hql, Plan.class).list();
    }

    @Override
    public Plan selectById(Integer id) {
        return getSession().get(Plan.class, id);
    }

    @Override
    public Integer insert(Plan vo) {
        vo.setStatus(vo.getStatus() == null ? 1 : vo.getStatus());
        vo.setEditStatus(vo.getEditStatus() == null ? 0 : 1);
        return (Integer) getSession().save(vo);
    }


    @Override
    public void update(Integer id, Plan vo) {
        Plan plan = getSession().get(Plan.class, id);
        // 只set 可以修改的欄位
        plan.setPlanPicture(vo.getPlanPicture());
        plan.setPlanTitle(vo.getPlanTitle());
        plan.setPlanIntroduction(vo.getPlanIntroduction());
        plan.setPlanPictureIntro1(vo.getPlanPictureIntro1());
        plan.setPlanPictures1(vo.getPlanPictures1());
        plan.setPlanPictureIntro2(vo.getPlanPictureIntro2());
        plan.setPlanPictures2(vo.getPlanPictures2());
        plan.setPlanPictureIntro3(vo.getPlanPictureIntro3());
        plan.setPlanPictures3(vo.getPlanPictures3());


        getSession().merge(plan);

    }

    @Override
    public void deleteById(Integer id) {
        Session session = getSession();
        Plan plan = session.load(Plan.class, id);
        session.remove(plan);
    }

    @Override
    public List<Plan> selectAllByVendorId(String vendorId) {
        String hql = "FROM Plan WHERE vendorId = :vendorId";
        Query<Plan> query = getSession().createQuery(hql, Plan.class);
        query.setParameter("vendorId", vendorId);
        return query.list();
    }

    @Override
    public void changeStatusToInactive(Integer planProductId) {
        Plan plan = getSession().get(Plan.class, planProductId);
        plan.setStatus(0); // 狀態改為下架
        getSession().merge(plan);
    }
}





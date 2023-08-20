package com.marryme.plan.dao.impl;

import com.marryme.plan.dao.ItemDao;
import com.marryme.plan.vo.Item;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

import static com.marryme.common.CommonString.ACTIVE;


/**
 * 方案加購項目Dao實作
 */
public class ItemDaoImpl implements ItemDao {

    @Override
    public List<Item> selectAll() {
        String hql = "FROM Item";
        return getSession().createQuery(hql, Item.class).list();
    }
    @Override
    public Item selectById(Integer id) {
        return getSession().get(Item.class, id);
    }
    @Override
    public List<Item> selectByIds(List<Integer> planItemIdList) {
        String hql = "FROM Item WHERE id IN :planItemIdList";
        return getSession().createQuery(hql, Item.class)
                .setParameterList("planItemIdList", planItemIdList)
                .list();
    }


    @Override
    public Integer insert(Item vo) {
        vo.setStatus(vo.getStatus() == null ? 1 : vo.getStatus());
        vo.setEditStatus(vo.getEditStatus() == null ? 0 : 1);
        return (Integer) getSession().save(vo);
    }

    @Override
    public void update(Integer id, Item vo) {
        Item item = getSession().get(Item.class, id);
        // 只set 可以修改的欄位
        item.setItemType(vo.getItemType());
        item.setItemSelect(vo.getItemSelect());
        item.setItemDescription(vo.getItemDescription());
        item.setItemDeposit(vo.getItemDeposit());
        item.setItemTotal(vo.getItemTotal());

        getSession().merge(item);

    }

    @Override
    public void deleteById(Integer id) {
        Session session = getSession();
        Item item = session.load(Item.class, id);
        session.remove(item);

    }

    @Override
    public List<Item> selectAllByVendorIdAndStatus(String vendorId, String statusType) {
        // 狀態 0下架 INACTIVE /  1上架 ACTIVE
        int status = ACTIVE.equals(statusType) ? 1 : 0;
        String hql = "FROM Item WHERE vendorId = :vendorId AND status = :status";
        Query<Item> query = getSession().createQuery(hql, Item.class);
        query.setParameter("vendorId", vendorId);
        query.setParameter("status", status);
        return query.list();
    }


    @Override
    public List<Item> selectAllVendorIdAndOrderByType(String vendorId,String statusType) {
            // 狀態 0下架 INACTIVE /  1上架 ACTIVE
            int status = ACTIVE.equals(statusType) ? 1 : 0;
            String hql = "FROM Item WHERE vendorId = :vendorId AND status = :status ORDER BY itemType ASC";
            Query<Item> query = getSession().createQuery(hql, Item.class);
            query.setParameter("vendorId", vendorId);
            query.setParameter("status", status);
            return query.list();


    }

    @Override
    public void changeStatusToInactive(Integer planItemId) {
        Item item = getSession().get(Item.class, planItemId);
        item.setStatus(0); // 狀態改為下架
        getSession().merge(item);
    }
}

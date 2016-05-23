package org.cleverframe.core.persistence.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.CallbackException;
import org.hibernate.Session;
import org.hibernate.classic.Lifecycle;
import org.hibernate.validator.constraints.Length;

import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;

/**
 * 含有基本字段的实体类抽象<br/>
 * <p/>
 * 作者：LiZW <br/>
 * 创建时间：2016-5-12 9:35 <br/>
 */
@MappedSuperclass
public abstract class DataEntity extends BaseEntity {
    /**
     * 数据所属公司的机构编码
     */
    protected String companyCode;

    /**
     * 数据直属机构的ID
     */
    protected String orgCode;

    /**
     * 创建者
     */
    protected String createBy;

    /**
     * 创建日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    protected Date createDate;

    /**
     * 更新者
     */
    protected String updateBy;

    /**
     * 更新日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    protected Date updateDate;

    /**
     * 备注
     */
    @Length(min = 0, max = 255, message = "备注信息长度必须是0——255个字符")
    protected String remarks;

    /**
     * 删除标记（1：正常；2：删除；3：审核）,以字典表sys_dict.dict_key=‘删除标记’为准'
     */
    protected Character delFlag = BaseEntity.DEL_FLAG_NORMAL;

    /**
     * 数据全局标识UUID
     */
    protected String uuid;

    /*
     * 持久化前操作，在实体对象Save/Insert操作之前触发<br/>
     * 1.生成UUID<br/>
     * 2.设置创建者<br/>
     * 3.获取该数据是哪个公司的数据(所属公司的机构编码)<br/>
     * 4.设置创建时间<br/>
     * */
    @Override
    public boolean onSave(Session session) throws CallbackException {
        super.onSave(session);
        //logger.debug("DataEntity--onSave");
//        this.companyId = getUserUtils().getCurrentCompanyId();
//        this.orgId = getUserUtils().getCurrentOrgId();
//        this.createBy = getUserUtils().getCurrentUserId();
//        this.createDate = new Date();
//        this.updateBy = getUserUtils().getCurrentUserId();
//        this.updateDate = new Date();
//        this.uuid = IDCreateUtils.uuid();
        return Lifecycle.NO_VETO;
    }

    /*
     * 数据更新前操作，在Session.update()操作之前触发<br/>
     * 1.设置更新用户<br/>
     * 2.设置更新时间<br/>
     * */
    @Override
    public boolean onUpdate(Session session) throws CallbackException {
        super.onUpdate(session);
        //logger.debug("DataEntity--onUpdate");
//        this.updateBy = getUserUtils().getCurrentUserId();
//        this.updateDate = new Date();
        return Lifecycle.NO_VETO;
    }

    /*在实体对象Delete操作之前触发*/
    @Override
    public boolean onDelete(Session session) throws CallbackException {
        super.onDelete(session);
        //logger.debug("DataEntity--onDelete");
        return Lifecycle.NO_VETO;
    }

    /*在实体对象被加载之后触发*/
    @Override
    public void onLoad(Session session, Serializable id) {
        super.onLoad(session, id);
        //logger.debug("DataEntity--onLoad");
    }

    /*--------------------------------------------------------------
     *          getter、setter
     * -------------------------------------------------------------*/

    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Character getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Character delFlag) {
        this.delFlag = delFlag;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
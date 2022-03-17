package com.api.igw.repository;

import com.api.igw.model.DataObj;
import com.api.igw.model.TransAchActivity;
import com.api.igw.model.TransAchDetail;
import com.api.igw.model.Transaction;

public interface TransactionRepositoryCustom {
    public DataObj initTrans(Transaction trans);
    public DataObj initTrans(Transaction trans, TransAchDetail transAchDetail);
    public DataObj initTrans(Transaction trans, TransAchDetail transAchDetail, TransAchActivity transAchActivity, String initType);
    public DataObj insertTrans (Transaction trans);
}

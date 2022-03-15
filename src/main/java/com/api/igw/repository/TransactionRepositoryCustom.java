package com.api.igw.repository;

import com.api.igw.model.DataObj;
import com.api.igw.model.Transaction;

public interface TransactionRepositoryCustom {
    public DataObj initTrans(Transaction trans);
}

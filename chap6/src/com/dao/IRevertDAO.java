package com.dao;
import com.vo.*;

import java.util.List;

public interface IRevertDAO {
    public List<Revert> getRevertByMessageID(int revertId);
    public boolean addRevert(Revert revert);
    public List<Revert> getAllRevert();
}

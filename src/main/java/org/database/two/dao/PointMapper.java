package org.database.two.dao;

import org.springframework.stereotype.Repository;

@Repository("pointMapper")
public interface PointMapper {
    void addPoint(int points);
}

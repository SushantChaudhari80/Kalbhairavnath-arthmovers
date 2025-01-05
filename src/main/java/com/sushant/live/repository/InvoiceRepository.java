package com.sushant.live.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sushant.live.model.InvoiceTemplate;

@Repository
public interface InvoiceRepository extends JpaRepository<InvoiceTemplate, String> {

	@Query("SELECT v FROM InvoiceTemplate v WHERE v.omobile = :mobile order by v.billedDate asc")
	public List<InvoiceTemplate> getByOmobile(@Param("mobile") String mobile);

	@Query("SELECT v FROM InvoiceTemplate v WHERE v.omobile = :mobile and id=:id")
	public InvoiceTemplate getById(@Param("mobile") String mobile,@Param("id") String id);
}

package com.kosta.jupjup.paging;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class PageVO {

  private int startPage;
  private int endPage;
  private boolean prev, next;
  private int total;
  private Criteria cri;

  
  public PageVO() {
	  
  }
  
  public PageVO(Criteria cri, int total) {

    this.cri = cri;
    this.total = total;

    this.endPage = (int) (Math.ceil(cri.getPageNum()*1.0 /10)) * 10;

    this.startPage = this.endPage - (10-1);

    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

    if (realEnd < endPage) {
     endPage = realEnd == 0 ? 1 : realEnd;
    }

    this.prev = this.startPage > 1;
    this.next = this.endPage < realEnd;
  }
  
}


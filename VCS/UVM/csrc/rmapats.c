// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

void  hsG_0__0 (struct dummyq_struct * I1296, EBLK  * I1290, U  I685);
void  hsG_0__0 (struct dummyq_struct * I1296, EBLK  * I1290, U  I685)
{
    U  I1554;
    U  I1555;
    U  I1556;
    struct futq * I1557;
    struct dummyq_struct * pQ = I1296;
    I1554 = ((U )vcs_clocks) + I685;
    I1556 = I1554 & ((1 << fHashTableSize) - 1);
    I1290->I727 = (EBLK  *)(-1);
    I1290->I731 = I1554;
    if (I1554 < (U )vcs_clocks) {
        I1555 = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, I1290, I1555 + 1, I1554);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I685 == 1)) {
        I1290->I733 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I727 = I1290;
        peblkFutQ1Tail = I1290;
    }
    else if ((I1557 = pQ->I1197[I1556].I745)) {
        I1290->I733 = (struct eblk *)I1557->I744;
        I1557->I744->I727 = (RP )I1290;
        I1557->I744 = (RmaEblk  *)I1290;
    }
    else {
        sched_hsopt(pQ, I1290, I1554);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif

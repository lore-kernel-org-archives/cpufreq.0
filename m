From: Dave Jones <davej@redhat.com>
Subject: Another .38 pull request.
Date: Wed, 9 Mar 2011 13:06:14 -0500
Message-ID: <20110309180614.GA2336@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, cpufreq@vger.kernel.org

One more patch that almost missed the boat.


Please pull from ..
master.kernel.org:/pub/scm/linux/kernel/git/davej/cpufreq.git/ fixes

 arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

commit 1f858ef2fbabdc5e645644010a31a40c32e397c9
Author: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Date:   Wed Mar 9 14:02:49 2011 +0000

    [CPUFREQ] pcc-cpufreq: don't load driver if get_freq fails during init.
    
    Return 0 on failure. This will cause the initialization of the driver
    to fail and prevent the driver from loading if the BIOS cannot handle
    the PCC interface command to "get frequency". Otherwise, the driver
    will load and display a very high value like "4294967274" (which is
    actually -EINVAL) for frequency:
    
    # cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
    4294967274
    
    Signed-off-by: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
    CC: stable@kernel.org
    Signed-off-by: Dave Jones <davej@redhat.com>

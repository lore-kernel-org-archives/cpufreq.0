From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14340] speedstep-ich driver not working in 2.6.31
Date: Sat, 30 Jul 2011 06:40:50 GMT
Message-ID: <201107300640.p6U6eoAc020260@demeter1.kernel.org>
References: <bug-14340-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-14340-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14340


Len Brown <lenb@kernel.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED
                 CC|                            |lenb@kernel.org




--- Comment #12 from Len Brown <lenb@kernel.org>  2011-07-30 06:39:57 ---
closed by:


commit 8dca15e40889e5d5e9655b03ba79c26200f760ce
Author: Rusty Russell <rusty@rustcorp.com.au>
Date:   Mon Nov 2 23:35:30 2009 -0800

    [CPUFREQ] speedstep-ich: fix error caused by
394122ab144dae4b276d74644a2f11c44a60ac5c

    "[CPUFREQ] cpumask: avoid playing with cpus_allowed in speedstep-ich.c"
    changed the code to mistakenly pass the current cpu as the "processor"
    argument of speedstep_get_frequency(), whereas it should be the type of
    the processor.

    Addresses http://bugzilla.kernel.org/show_bug.cgi?id=14340

    Based on a patch by Dave Mueller.

    Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
    Acked-by: Dominik Brodowski <linux@brodo.de>
    Reported-by: Dave Mueller <dave.mueller@gmx.ch>
    Cc: <stable@kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Dave Jones <davej@redhat.com>

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

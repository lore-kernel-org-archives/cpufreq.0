From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10982] scaling_max_freq locked - Thinkpad T42
Date: Thu, 26 Jun 2008 04:37:38 -0700 (PDT)
Message-ID: <20080626113738.8CDE4108047@picon.linux-foundation.org>
References: <bug-10982-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10982-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10982


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de




------- Comment #3 from trenn@suse.de  2008-06-26 04:37 -------
The T61 where this has been reported recently on the cpufreq list did always
show a _PPC value of 0 which is correct. If ignore_ppc=1 still helps it could
also be some more complex kernel/cpufreq and not a BIOS/_PPC problem.

Can you reproduce this easily (e.g. always after some short time or trigger
it)? The report on the T61 was that it only happens on some boots, which makes
it very hard to debug it there or to verify whether a patch/change helps or
not.

If this is ACPI thermal related and is a regression it might be this one:
commit d9460fd227ed2ce52941b6a12ad4de05c195f6aa
Date:   Thu Jan 17 15:51:23 2008 +0800
    ACPI: register ACPI Processor as generic thermal cooling device

If you can reproduce the problem easily, uou may want to give it a try and test
with and without that patch (go back the git history if it doesn't patch
anymore). git-bisect is also an option then (if easy to reproduce) if it is
something else.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

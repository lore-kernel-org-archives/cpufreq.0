From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10564] Randomly sets max freq equal to min freq
Date: Wed, 30 Apr 2008 03:29:35 -0700 (PDT)
Message-ID: <20080430102935.BA3EF108061@picon.linux-foundation.org>
References: <bug-10564-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10564-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10564





------- Comment #8 from trenn@suse.de  2008-04-30 03:29 -------
commit e56a727b023d40d1adf660168883f30f2e6abe0a
Author: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Date:   Mon Apr 28 15:13:43 2008 -0400

    [CPUFREQ] Make acpi-cpufreq more robust against BIOS freq changes behind
our back.

If this does not help, I wonder whether ignore_ppc=1 as processor module
parameter helps?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

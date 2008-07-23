From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 11139] warning in cpufreq.c on E450
Date: Tue, 22 Jul 2008 17:38:32 -0700 (PDT)
Message-ID: <20080723003832.B3EB910800A@picon.linux-foundation.org>
References: <bug-11139-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-11139-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=11139





------- Comment #2 from cesarb@cesarb.net  2008-07-22 17:38 -------
There's another auxio_probe, at arch/sparc/kernel/auxio.c, which seems to be
called deep within setup_arch() if I followed the code paths correctly. The one
called at fs_initcall is the one at arch/sparc64/kernel/auxio.c.

This is probably not a regression; the warning was added after 2.6.25 (see
commit 74212ca432982903d0fc6a0f282b199e000ad8b1). The bug probably was there
all the time.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

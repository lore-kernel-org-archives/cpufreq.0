From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9708] powersave governor does not scale down when power gets
	connected
Date: Wed,  9 Jan 2008 12:47:50 -0800 (PST)
Message-ID: <20080109204750.1FEB2108069@picon.linux-foundation.org>
References: <bug-9708-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9708-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9708





------- Comment #5 from deller@gmx.de  2008-01-09 12:47 -------
Hi Thomas,
yep, this bug report here is exactly the same symptom/problem as in Novell's
bugzilla https://bugzilla.novell.com/show_bug.cgi?id=334378.

Differences are:
- different Laptops (HP & Dell)
- different Linux kernel versions (incl. mainline 2.6.24 which I run)
- different distributions (Fedora & SUSE)
-> IMHO clearly a Linux kernel problem in all kernels (2.6.22 -> 2.6.24).


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

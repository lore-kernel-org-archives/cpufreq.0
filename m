From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8601] 'conservative' governor never changes cpu speed
	(2.6.21.3)
Date: Sat, 18 Aug 2007 01:33:05 -0700 (PDT)
Message-ID: <20070818083305.D5A7110801C@picon.linux-foundation.org>
References: <bug-8601-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8601-3570@http.bugzilla.kernel.org/>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8601


alex-kernel@digriz.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alex-kernel@digriz.org.uk




------- Comment #1 from alex-kernel@digriz.org.uk  2007-08-18 01:40 -------
Could you:
1. not use the centrino speedstep module and use the ACPI based one instead[1]

2. my partner has this laptop (well the T42p) and she has no problems.  We did
run into issues where occasionally no governor, even userspace, could change
speed (same happened on my T40p) and that was linked to the BIOS forcing the
laptop to a particular speed.  Disable the cpu performance bits under your BIOS
and see what happens[2]

Cheers

Alex

[1] look at Myth 9 on page 9 of
https://ols2006.108.redhat.com/2007/Reprints/brown_1-Reprint.pdf
[2]
http://www.thinkwiki.org/wiki/Talk:How_to_make_use_of_Dynamic_Frequency_Scaling#CPUfreq_.22stuck.22


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

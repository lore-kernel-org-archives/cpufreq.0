From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9745] CPU is waking up too often
Date: Mon, 14 Jan 2008 05:12:09 -0800 (PST)
Message-ID: <20080114131209.3B57E10806D@picon.linux-foundation.org>
References: <bug-9745-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9745-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9745


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tglx@linutronix.de,
                   |                            |trenn@suse.de, mingo@elte.hu




------- Comment #1 from trenn@suse.de  2008-01-14 05:12 -------
This has nothing to do with cpufreq, but with timers.
I also saw a similar bugreport somewhere else.

I cannot help here (but would like to learn how to debug this...), if you have
some luck Ingo Molnar or Thomas Gleixner can give you some hints how to debug
this.

I expect this has been introduced (just a guess, git should help) by the
clockevents/highres/tickless timer patches. If you could prove this with git,
you should get some help from the author of the patchsets...


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10564] Randomly sets max freq equal to min freq
Date: Sat,  3 May 2008 09:50:00 -0700 (PDT)
Message-ID: <20080503165000.B1424108062@picon.linux-foundation.org>
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


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |venkatesh.pallipadi@intel.co
                   |                            |m




------- Comment #11 from trenn@suse.de  2008-05-03 09:50 -------
> but now I'm back to the system not even being able to keep up with my typing
> and everything sluggish.
Puhh, could be the latest locking changes? Maybe irqs are held too long or
similar?

Scott, if you could do a git bisect, as you already know about which kernel
versions are affected it shouldn't be that much work...
If you could tell Venkatesh which patch it is then, it should be easy to fix.

You should spinlock debug compile in, maybe you already get a hint that
somewhere things get stuck for a while...


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

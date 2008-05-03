From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10564] Randomly sets max freq equal to min freq
Date: Sat,  3 May 2008 08:13:14 -0700 (PDT)
Message-ID: <20080503151314.E1F84108060@picon.linux-foundation.org>
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





------- Comment #10 from stonecrest@gmail.com  2008-05-03 08:13 -------
I also now tried ignore_ppc=1. This is interesting, as cpufreq-info shows the
correct min/max frequencies, but I can tell that the issue is definitely not
resolved. Things were normal when I first booted up, but now I'm back to the
system not even being able to keep up with my typing and everything sluggish.
So despite cpufreq-info reporting the correct max freq, I don't know that
anything else fundamentally changed.

It looks like there are a number of people with this issue
(http://bbs.archlinux.org/viewtopic.php?pid=363228#p363228), and they claim it
started with the 2.6.24 kernel. That's consistent with what I guessed, although
I have not yet verified that this was definitely the kernel version where
things changed. And I should note that I'm testing on the mainline kernel
without patches, despite the reference to Archlinux.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

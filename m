From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6382] Random lockups, no kernel panic just a compleate hang
Date: Wed, 25 Jul 2007 03:40:16 -0700 (PDT)
Message-ID: <20070725104016.3C0AC1080E2@picon.linux-foundation.org>
References: <bug-6382-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-6382-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6382


izaera@autentia.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |izaera@autentia.com




------- Comment #13 from izaera@autentia.com  2007-07-25 03:45 -------
Hi both:

I think I have the same problem on an AMD 64 with Debian Testing, kernel
2.6.21-2-amd64 #1 SMP. It is a desktop PC. I'm just adding myself to the CC
list of this bug to get notifications of what's going on. If I can be of any
help, please let me know.

I'm now testing "modprobe -r powernow_k8" and it's been working for two hours
without hang. Before it hung in less than an hour (about 10 times since
yesterday).

You can also find more people with similar problems here:

https://bugs.launchpad.net/tuxlab/+source/linux-source-2.6.17/+bug/85370


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

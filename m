From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Tue, 22 Apr 2008 01:00:42 -0700 (PDT)
Message-ID: <20080422080042.E2974108066@picon.linux-foundation.org>
References: <bug-8264-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8264-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Comment #27 from izaera@autentia.com  2008-04-22 01:00 -------
Hi everybody:

I have added comments in bugs 6382 and 8547 because I think they are duplicates
of this problem. I also proposed to follow the solution in this bug as it seems
the most active/explanatory.

Mark and Natalie: I'm thinking in setting the governor to userspace and make a
program to do smooth transitions (for example: no more than one per second). Do
you think that would suffice to bypass the problem? Also, do you think this can
be achieved by using powerfreqd or a custom script/daemon should be written?

Thanks for your help.
Ivan


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.

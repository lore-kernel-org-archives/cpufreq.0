From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 4379] Default sampling rates for ondemand governor are too high
	on a amd64
Date: Mon, 19 Nov 2007 05:17:42 -0800 (PST)
Message-ID: <20071119131742.925B710806C@picon.linux-foundation.org>
References: <bug-4379-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-4379-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=4379





------- Comment #6 from piel@lifl.fr  2007-11-19 05:17 -------
(Sorry for answering late, I haven't received directly any email, just saw the
message on the mailing list.)

What I was talking about in comment #4 was this commit. It's to keep the the
frequency low enough compared to the scheduler. The attached patch, on the
contrary, _increases_ the frequency. 

Unfortunately Gunther hasn't confirm this patch helps with his problem.
However, now the sampling down is done as often as the sampling up so it should
be less problematic anyway. 1000 is a very conservative value but nowadays,
with the great hunt for reducing the wakeups that can probably be considered
fine. It would be nice if Gunther could confirm the behavior is currently
better (slow down happens fast enough)...


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

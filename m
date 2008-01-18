From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9729] ondemand cpufreq governor doesn't see when
	kcryptd/dm-crypt is busy
Date: Fri, 18 Jan 2008 14:42:43 -0800 (PST)
Message-ID: <20080118224243.DE720108069@picon.linux-foundation.org>
References: <bug-9729-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9729-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9729


tch@wpkg.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |REJECTED
         Resolution|                            |INVALID




------- Comment #3 from tch@wpkg.org  2008-01-18 14:42 -------
This indeed must be some kind of dm-crypt/kcryptd "feature" and/or some
confusion on how to read CPU usage.

While reading from that dm-crypt device, the following CPU usage was shown (the
numbers are consistent across a few tests):

187 MHz -> ~75% system CPU time in top
375 MHz -> ~66% system CPU time in top
562 MHz -> ~94% system CPU time in top
750 MHz -> ~85% system CPU time in top
937 MHz -> ~85% system CPU time in top
1125 MHz -> ~83% system CPU time in top
1312 MHz -> ~70% system CPU time in top
1500 MHz -> ~70% system CPU time in top


Looks like dm-crypt won't eat the whole CPU power for some reason.

With default 80 as up_threshold for "ondemand" governor, no wonder the
frequency didn't scale up.

So a "fix" for this bug is a matter of lowering up_threshold.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

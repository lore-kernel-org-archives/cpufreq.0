From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10564] Randomly sets max freq equal to min freq
Date: Sun, 27 Apr 2008 10:14:27 -0700 (PDT)
Message-ID: <20080427171428.0583110805F@picon.linux-foundation.org>
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





------- Comment #2 from andrew@andrewyates.net  2008-04-27 10:14 -------
I have the same problem, but with this CPU: Intel(R) Core(TM)2 Duo CPU    
T9300  @ 2.50GHz

For me, the problem can sometimes be triggered by removing the battery while
the AC is plugged in. With both battery and AC, cpufreq works as normal, but
when I remove the battery I cannot set a frequency higher than 1.2GHz.

I did not notice this problem before 2.6.24.2, but I started using this laptop
soon before .24.2 was released so I cannot confirm whether or not it's a
regression.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

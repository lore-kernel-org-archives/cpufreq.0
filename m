From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6382] Random lockups, no kernel panic just a compleate hang
Date: Tue, 22 Apr 2008 00:51:15 -0700 (PDT)
Message-ID: <20080422075115.7D3B0108035@picon.linux-foundation.org>
References: <bug-6382-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6382





------- Comment #15 from izaera@autentia.com  2008-04-22 00:51 -------
Hi Natalie:

I have tried with kernel 2.6.24 and it still hangs. I think this bug is related
(if not the same) to 8547 and 8264.

I propose to follow this problem in bug 8264 to centralize all comments (mark
8547 and 6382 as duplicats of 8264) 

What do you think? Can anyone confirm if those three are the same bug?

Thanks.
Ivan


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

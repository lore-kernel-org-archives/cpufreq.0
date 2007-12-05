From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9475] jiffies counter leaps on CPU frequency changes
Date: Wed,  5 Dec 2007 12:43:59 -0800 (PST)
Message-ID: <20071205204359.4721911D108@picon.linux-foundation.org>
References: <bug-9475-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9475-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9475





------- Comment #10 from mingo@elte.hu  2007-12-05 12:43 -------

> I just managed to boot 2.6.23. Nothing changes. Do you want me to 
> bisect some specific tree?

nothing changes == same problem?

If yes then please try to find the oldest kernel that still works fine. 
2.6.20 would be a good pick i think, 2.6.16 after that. Then if you 
could try to bisect between the youngest "good" and the oldest "bad" 
tree that would be fantastic ... Expect a compile-fest though.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9703] T5500 1.66GHz: kernel reports bogus available frequencies
	and downscales only to 996MHz
Date: Wed, 11 Jun 2008 09:30:49 -0700 (PDT)
Message-ID: <20080611163049.E9E2511D10C@picon.linux-foundation.org>
References: <bug-9703-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9703-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9703





------- Comment #3 from olel@ans.pl  2008-06-11 09:30 -------
(In reply to comment #1)
> Krzysztof, have you had better luck with recent kernels?

Hard to tell as both 2.6.25 and 2.6.26-rc5 hang during a kernel boot. I need to
create new bugreports to solve this problem before I'll be able to check
cpufreq on that kernels.

> If so, you should
> probably provide acpidump from your system.

attached


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

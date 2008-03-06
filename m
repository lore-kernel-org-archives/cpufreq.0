From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8547] "Hardware error - pending bit very stuck" on Mobile AMD
	Sempron
Date: Wed,  5 Mar 2008 23:18:09 -0800 (PST)
Message-ID: <20080306071809.3B04A108066@picon.linux-foundation.org>
References: <bug-8547-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8547-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8547





------- Comment #7 from nm127@freemail.hu  2008-03-05 23:18 -------
As of linux-2.6.23 the "powernow-k8" messages are the same:

powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 2600+ processors (1 cpu
cores) (version 2.00.00)
powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6
powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18
powernow-k8: ph2 null fid transition 0x8


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

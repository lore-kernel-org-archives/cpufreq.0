From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8720] still problems with k7 mobile frequency is lower than
	real
Date: Sat,  1 Sep 2007 05:43:13 -0700 (PDT)
Message-ID: <20070901124313.C4837108013@picon.linux-foundation.org>
References: <bug-8720-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8720-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8720





------- Comment #17 from cimmo@libero.it  2007-09-01 05:43 -------
Created an attachment (id=12660)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=12660&action=view)
dmesg with athlon xp-m 2500+ and kernel 2.6.22.5

this is a self-compiled 2.6.22.5 kernel with cpu freq debug support

dmesg attached and kernel started with cpufreq.debug=3 parameter under athlon-m
 2500+ where the bug DOESN'T occur


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

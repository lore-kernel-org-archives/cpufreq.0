From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8720] still problems with k7 mobile frequency is lower than
	real
Date: Sun, 22 Jul 2007 17:08:28 -0700 (PDT)
Message-ID: <20070723000828.C7AEF108080@picon.linux-foundation.org>
References: <bug-8720-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8720





------- Comment #4 from cimmo@libero.it  2007-07-22 17:13 -------
Created an attachment (id=12097)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=12097&action=view)
dmesg from kubuntu 7.10 tribe3 + XP-M 2800+

this the dmesg with the same identical notebook, kubuntu 7.10 tribe3 but
another Athlon XP Mobile, this time it's a 2800+ that should have 2,14 ghz
instead it's always recognized as: 1472-1473 Mhz

[    0.000000] Detected 2142.556 MHz processor.

[  239.598408] powernow: PowerNOW! Technology present. Can scale: frequency and
voltage.
[  239.653057] powernow: Trying ACPI perflib
[  239.669325] powernow: Minimum speed 1472 MHz. Maximum speed 1472 MHz.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

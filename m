From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9708] powersave governor does not scale down when power gets
	connected
Date: Tue,  8 Jan 2008 10:51:55 -0800 (PST)
Message-ID: <20080108185155.3CD87108069@picon.linux-foundation.org>
References: <bug-9708-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9708-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9708





------- Comment #2 from deller@gmx.de  2008-01-08 10:51 -------
Yes, I'm using the latest BIOS.

In the BIOS there is no specific Performance/ACPI changes possibile. The only
option I found was something like "Use Intel SpeedStep Technology" with Yes,
No, Automatic. I choosed Automatic.

I don't see any ACPI error messages in dmesg. The problem in
http://bugzilla.kernel.org/show_bug.cgi?id=9558 does not seem related to my
bug.

Any other ideas or any other information needed?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

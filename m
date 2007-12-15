From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9151] Something broke cpufreq on laptop with lid behavior
	between 2.6.17 and 2.6.23
Date: Sat, 15 Dec 2007 08:44:11 -0800 (PST)
Message-ID: <20071215164411.1F50E108069@picon.linux-foundation.org>
References: <bug-9151-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9151-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9151


deller@gmx.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |deller@gmx.de




------- Comment #9 from deller@gmx.de  2007-12-15 08:44 -------
I see this problem sometimes too. (acpi-cpufreq driver does not speed down)
System: HP NC6000 Laptop, Pentium M 1.6GHz, Fedora7, Kernel 2.6.24-rc4.
When running on AC at full CPU speed, then plugging AC, CPU speed stays at 1600
MHz. Even when switching manually to powersafe governour, acpi-cpufreq does not
change back to 600 MHz. It seems it thinks it is already running on 600 MHz.
Only when I switch to ondemand and then back to powersafe governour the speed
finally goes down to 600 MHz.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

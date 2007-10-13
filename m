From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9151] Something broke cpufreq on laptop with lid behavior
Date: Sat, 13 Oct 2007 13:06:50 -0700 (PDT)
Message-ID: <20071013200650.78E8B108010@picon.linux-foundation.org>
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





------- Comment #2 from stevenm@umd.edu  2007-10-13 13:06 -------
Created an attachment (id=13148)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=13148&action=view)
Dmesg output with odd behavior and cpufreq.debug=7

There is the debug info. Messages starting with ** are echoed by me into kmsg
so that you can see what I tried to do then. The system was booted up using
battery power and then an AC adapter was attached when indicated. This time it
didn't do any odd things with throttling, but it definitely magically shot up
to 2GHz and wouldn't go to 600MHz unless I set it to 800MHz first. The test was
done in a console environment without any windowing stuff or KDE battery
monitor running. ACPID and laptop_mode were removed from rc.d before the system
was booted with this kernel.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

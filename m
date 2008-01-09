From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9708] powersave governor does not scale down when power gets
	connected
Date: Wed,  9 Jan 2008 12:40:40 -0800 (PST)
Message-ID: <20080109204040.12E32108069@picon.linux-foundation.org>
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





------- Comment #4 from deller@gmx.de  2008-01-09 12:40 -------
Created an attachment (id=14385)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=14385&action=view)
Full syslog from bootup to shutdown. Problem happened shortly before timestamp
"Jan  9 21:14:59"

Good news! Attached is the full syslog from startup of system to shutdown with
ACPI debug enabled.
If you watch out for the "MARKER:" flags, you'll see what I just started to do,
or what I just found. The real problem happens between timestamp 21:14:35 and
21:14:59 
Hope that helps to find the bug.

PS: It seems cpufreq debugging is not visible. maybe the boot option you
mentioned was wrong? (I'll check if necessary).


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

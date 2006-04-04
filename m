From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6331] cpu frequency gets lowered by kernel when cord is
	pulled(init=bin/sh)
Date: Tue, 4 Apr 2006 13:24:40 -0700
Message-ID: <200604042024.k34KOd5U015758@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6331

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |INVALID



------- Additional Comments From davej@codemonkey.org.uk  2006-04-04 13:24 -------
I've seen a bunch of machines do this, and there's not a thing we can do about
it.  The kernel isn't what's changing the speed, the BIOS is doing it via SMM
traps when a power change occurs.  It's taken quite a bit of work for the
kernel to event detect that this has happened, as SMMs are completely
transparent to the OS.  (That's why it takes a while for the kernel to realise
that it changed).

Maybe there's something in the BIOS you can change to disable this 'feature' ?


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

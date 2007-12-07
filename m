From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9475] jiffies counter leaps on CPU frequency changes
Date: Thu,  6 Dec 2007 21:16:09 -0800 (PST)
Message-ID: <20071207051609.B549910806C@picon.linux-foundation.org>
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





------- Comment #13 from stefano.brivio@polimi.it  2007-12-06 21:16 -------
(In reply to comment #12)
> Some Intel TSC facts, for the record:
> 
> if (family == 6 && model < 14) || (family == 15 && model < 3)
>    TSC rate = Core MHz rate (ie. it changes with core/bus ratio shifts)
>    WRMSR on the TSC writes bottom 32-bits, clears upper 32 bits.

Thank you for the info.

> But note that the bigger problem may be that on all Intel processors
> with C3 that have shipped to date, the TSC COMPLETELY STOPS
> for the duration of C3.

During C2 as well, maybe?

> I believe that tsc_unstable is set upon either of these situations.

Yes, no worries, I hit both :)

Nov 29 07:55:29 morte [    6.530752] Marking TSC unstable due to: possible TSC
halt in C2.
Nov 29 07:55:29 morte [    6.530761] Time: acpi_pm clocksource has been
installed.
Nov 29 07:55:29 morte [    6.620700] Clocksource tsc unstable (delta =
-456217276 ns)

and

Nov 29 20:50:31 morte [  297.562722] Marking TSC unstable due to: cpufreq
changes.

Anyway, I tried to follow your two suggestions and I must say that variable TSC
causes issues, while TSC stoppage doesn't, in my case. In both cases, the
timestamp isn't correct, but while TSC stoppage causes, well, a stop, the big
trouble is when the timestamp leaps back because of cpufreq changes, and
drivers get confused by this behaviour.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

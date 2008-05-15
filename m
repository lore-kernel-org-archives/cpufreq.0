From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Thu, 15 May 2008 10:42:57 -0700 (PDT)
Message-ID: <20080515174257.2ADEF108061@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10658





------- Comment #33 from trenn@suse.de  2008-05-15 10:42 -------
I agree with Len that:
Enable polling when no _TZP method in thermal zone
in general is not a good idea.
tzp was a module parameter for thermal, does this not work anymore for latest
kernels?

IMO this should better be done via dmi for the D610 only, there are already dmi
specific hooks in thermal.c setting tzp...
It's ugly, but you could set up the whole passive trip point inside a dmi
entry.
Len probably can accept this?

On longterm there will be the possibility to do passive cooling without ACPI,
either in userspace, hopefully in kernel space. It's something I like to see
for quite some time already. Matthew, if you are interested I'd like to CC you
in relevant posts. Getting some support in this area would be great.

Len, pls reopen. Dell Latitude not being supported is not acceptable. Not sure,
but AFAIK D610 and D800 were even one of default Novell employee laptops...
(too late to bring up enough humour and add a smiley here).

BTW: Has someone an idea why these are overheating now?
Did you make sure the fan slots are clean (I fixed up a bug like that
recently).


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.

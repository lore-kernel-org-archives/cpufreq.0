From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Wed, 25 Jun 2008 06:58:12 -0700 (PDT)
Message-ID: <20080625135812.C8A10108045@picon.linux-foundation.org>
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





------- Comment #60 from trenn@suse.de  2008-06-25 06:58 -------
> how is the machine violating the specs?
The thermal zone must provide a sane _TZP Thermal Zone Polling and a passive
cooling trip point to provide a proper thermal management.
Ok, in strict sense they are not violating the spec here if the critical shut
down is intended. But it is not.

> I'd much rather see a generic solution to this...
I am all against compatibility to specific Microsoft OS bugs and workarounds.
(This depends, say all workarounds that can be fixed with _OSI hooks).
We will end up with double polling temp on a lot machines and punish those who
are doing it right, e.g. HP sends thermal events. While Microsoft will fix
their bug with their next OS Release or a Service Pack.
But as I already said, I agree that thermal management is too important and a
generic solution is also very appreciated from my side.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.

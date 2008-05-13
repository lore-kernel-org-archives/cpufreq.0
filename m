From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] CPU overheats at high frequencies,
	ACPI fails to throttle sufficiently.
Date: Tue, 13 May 2008 05:24:36 -0700 (PDT)
Message-ID: <20080513122436.77DA511D107@picon.linux-foundation.org>
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





------- Comment #22 from kvolny@redhat.com  2008-05-13 05:24 -------
(In reply to comment #21)
> Re: comment #20, failure to spin up the fan on the V3505 is a separate
> problem and should be filed as a separate bug, I think.

I'll have to investigate further, I suspect some hardware failure ...

> The issue being discussed here is about throttling the CPU to prevent
> an overheat when the fan is not doing enough. Getting this right might
> prevent an overheat on the V3505 machine also, but the fan problem needs
> to be addressed separately as well.

exactly - I just wanted to say that it is not a matter of renewing the heatsink
paste, but rather a common problem which should be prevented at any point where
it is possible


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
